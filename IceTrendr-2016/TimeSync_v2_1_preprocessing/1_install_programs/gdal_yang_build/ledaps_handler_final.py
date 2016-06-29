#********************************************************
# ledaps_handler_final.py: convert ledaps hdf4 image to 
#   reflectance and cloud mask
#
# Author: Yang Z.
# Usage:  ledaps_hander_final.py targz_path, output_path, tmp_path
# 
#********************************************************
import tarfile
import shutil
import os
import re
import sys
import numpy
from osgeo import gdal
from osgeo import gdalconst

class ledaps_handler:
    """Process LEDAPS image for TimeSync: 
    1.Stack ledaps surface reflectance image from HDF to ENVI format. 
    2.Extract cloud mask image based on LEDAPS QA flag
    """
    
    @staticmethod
    def lndsr_files(members):
        for tarinfo in members:
            print(tarinfo.name)
            if tarinfo.name.find('lndsr') > 0:
                yield tarinfo

    @staticmethod
    def it_basename(basename, appendix='_archv.bsq'):
        """convert ledaps name to icetrendr name convention
        
        LEDAPS: LE70450301999195EDC00 
        ICETRENDR: LE7045030_1999_195
        
        LEDAPS: IT50450301987234XXX02
        ICETRENDR: IT5045030_1987_234
        """
        return basename[0:9]+'_'+basename[9:13]+'_'+basename[13:16] + appendix
    
    @staticmethod
    def createCloudmask(outdir, qafile, basename):
        mask_cmd = 'gdal_translate -ot Byte -of ENVI -scale {0} {0} 1 1 {1} {2}'
        masks = []
        for value in mask_values:
            this_mask = os.path.join(outdir, 'mask_' + value + 'bsq')
            os.system(mask_cmd.format(value, qafile, this_mask))
            masks.append(this_mask)
        
        merge_cmd = "gdal_merge.py -o {0} -of envi -n 0 {1}"
        mask_file = os.path.join(outdir, it_basename(basename, '_cloudmask.bsq'))
        os.system(merge_cmd.format(mask_file, ' '.join(masks)))
        
    
    @staticmethod
    def extract_tgz(tgzfile, output_path, tmp_path="."):
        #extract the hdf file
        tar = tarfile.open(tgzfile)
        tar.extractall(members=ledaps_handler.lndsr_files(tar), path=tmp_path)
        tar.close()
        
        # find out the directory name for ledaps extracted files
        basefile =  os.path.basename(tgzfile).replace('-sr.tar.gz', '')
        
        #find image year information
        image_year = basefile[9:13]
        this_outputdir = os.path.join(output_path, image_year)
        if not os.path.exists(this_outputdir):
            os.mkdir(this_outputdir)
        
        #now process the hdf file
        ledaps_dir = os.path.join(tmp_path, basefile)
        hdf_files = [f for f in os.listdir(ledaps_dir) if f.endswith('.hdf')]

        hdf_file = hdf_files[0]
        refl_file = hdf_file.replace('.hdf', '.bsq')
        
        cmd = "gdalinfo " + os.path.join(ledaps_dir, hdf_file)
        tr_cmd = 'gdal_translate -of ENVI -a_nodata -9999 {0} {1}'
        f = os.popen(cmd)
        info = f.readlines()
        f.close()
        
        bands = []
        for line in info:
            line = line.strip()
            mo = re.match("SUBDATASET_\d_NAME=", line)
            if mo:
                dataset = line.replace(mo.group(),'')
                this_file = dataset[-5:] + ".bsq"
                print('creating ' + this_file + '...')
                os.system(tr_cmd.format(dataset, os.path.join(ledaps_dir, this_file)))
                bands.append(os.path.join(ledaps_dir, this_file))

        merge_cmd = "gdal_merge.py -o {0} -of envi -separate {1}"

        #now extract the refectance image
        print("stacking images to create " + refl_file)
        os.system(merge_cmd.format(os.path.join(ledaps_dir, refl_file), ' '.join(bands[0:6])))
        
        #reproject to albers
        warp_cmd = 'gdalwarp -of ENVI -t_srs albers.txt -tr 30 30 -srcnodata "-9999 0" -dstnodata "-9999" {0} {1}'
        this_refl = ledaps_handler.it_basename(basefile, '_archv.bsq')
        print("reproject to utm: " + this_refl)
        print(warp_cmd.format(os.path.join(ledaps_dir, refl_file), os.path.join(ledaps_dir, this_refl)))
        os.system(warp_cmd.format(os.path.join(ledaps_dir, refl_file), os.path.join(this_outputdir, this_refl)))

        #now reproject QA image
        qa_warp_cmd = 'gdalwarp -of ENVI -t_srs albers.txt -tr 30 30 -srcnodata "3" -dstnodata "0" {0} {1}'
        this_qa = ledaps_handler.it_basename(basefile, '_cloudmask.bsq')
        os.system(qa_warp_cmd.format(os.path.join(ledaps_dir, 'sr_QA.bsq'), os.path.join(ledaps_dir, this_qa)))
        
        #now create cloud mask
        ledaps_handler.create_ledaps_cloudmask(os.path.join(ledaps_dir, this_qa), os.path.join(this_outputdir, this_qa))
        
        #remove temporary file
        shutil.rmtree(os.path.join(ledaps_dir))
    
    @staticmethod
    def create_ledaps_cloudmask(qa_file, cloudmask_file):
        """convert ledaps QA flag to binary cloudmask: 1 clear pixel, 0 cloudy"""
        
        #open qa file for readonly access
        dataset = gdal.Open(qa_file, gdalconst.GA_ReadOnly)
        if dataset is None:
            print("failed to open " + qa_file)
            return 1
        
        #create the cloud mask file
        qa = dataset.GetRasterBand(1)
        cloudmask = dataset.GetDriver().Create(cloudmask_file, qa.XSize, qa.YSize, 1, gdalconst.GDT_Byte)
        cloudmask.SetGeoTransform(dataset.GetGeoTransform())
        cloudmask.SetProjection(dataset.GetProjection())
        
        
        print 'Band Type = ', gdal.GetDataTypeName(qa.DataType)
        
        for y in range(qa.YSize):
            qval = qa.ReadAsArray(0, y, qa.XSize, 1)
            mask = numpy.bitwise_and(qval, 5910)
            mask = (1- (mask > 0)) * (qval > 0)
            cloudmask.GetRasterBand(1).WriteArray(mask, 0, y)
    
        dataset = None
        cloudmask = None
        
        return 0
    
    @staticmethod
    def processLedaps(ledapsdir, output_path, tmp_path):
        """process all the ledaps targz files in the specified directory
            
            output_path: output directory for image stacks
            tmp_path: temporary processing directory
        """
        all_targzs = [f for f in os.listdir(ledapsdir) if f.endswith('sr.tar.gz')]
        failed = []
        for tgz in all_targzs: 
            try:
                ledaps_handler.extract_tgz(os.path.join(ledapsdir, tgz), output_path, tmp_path)
            except:
                print(sys.exc_info()[0])
                failed.append(tgz)
                
        print("The following images failed:\n" + "\n".join(failed))
              
def main(argv):
    usage = """
         usage: ledaps_hander_final.py targz_path, output_path, tmp_path
            
            targz_path: full directory name to where ledaps targz files are 
            output_path: all extracted images will stored here
            tmp_path: a temporary directory used to process the images
            
            """
    if len(argv) < 4:
        print(usage)
    else:
        ledaps_handler.processLedaps(argv[1], argv[2], argv[3])

if __name__ == "__main__":
    main(sys.argv)
