#*******************************************************************************
#
#        Harvest Image Chips
#
#*******************************************************************************
import os
import sys
import Image
import numpy
import gdal
from gdalconst import *

TCB_STRETCH = [0, 0.3098, 0.76, 0.1247]
TCG_STRETCH = [-0.045, 0.1549, 0.395, 0.0799]
TCW_STRETCH = [-0.35, -0.0701, 0.025, 0.0772]

def read_spectral(spectral_file, x, y, width, height, band=0):
    """ read spectral value from band centered around [x, y]
    with width and height"""

    spec_ds = gdal.Open(spectral_file, GA_ReadOnly)

    transform = spec_ds.GetGeoTransform()

    xoffset = int(x - transform[0])/30 - width / 2
    yoffset = int(transform[3]-y)/30 - height / 2

    # plot is outside the image boundary
    if xoffset < 0 or yoffset > spec_ds.RasterYSize-1:
        return [-9999]

    if band > 0:
        this_band = spec_ds.GetRasterBand(band)
        specs = this_band.ReadAsArray(xoffset, yoffset, width, height)
    else:
        specs = spec_ds.ReadAsArray(xoffset, yoffset, width, height)
    # import pdb; pdb.set_trace()
    return specs

def save_chip(r, g, b, r_stretch, g_stretch, b_stretch, image_file):
    """Save input r,g,b using r_stretch, g_stretch, and b_stretch as png

    where rgb are array of the same dimension
    *_stretch is an array of [min, mean, max, stdev]
    """

    rcolor = (r - r_stretch[1] + 2 * r_stretch[3])/(4 * r_stretch[3]) * 255
    gcolor = (g - g_stretch[1] + 2 * g_stretch[3])/(4 * g_stretch[3]) * 255
    bcolor = (b - b_stretch[1] + 2 * b_stretch[3])/(4 * b_stretch[3]) * 255

    rcolor[rcolor < 0] = 0
    rcolor[rcolor > 255] = 255
    gcolor[gcolor < 0] = 0
    gcolor[gcolor > 255] = 255
    bcolor[bcolor < 0] = 0
    bcolor[bcolor > 255] = 255

    color = numpy.uint8(numpy.dstack((rcolor, gcolor, bcolor)))

    this_image = Image.fromarray(numpy.asarray(color))

    this_image.save(image_file, "PNG")

def create_chip(spectral_file, x, y, width, height, chip_file):

    #read TC b,g,w
    tcb = read_spectral(spectral_file, x, y, width, height, 1)/10000.
    tcg = read_spectral(spectral_file, x, y, width, height, 2)/10000.
    tcw = read_spectral(spectral_file, x, y, width, height, 3)/10000.

    save_chip(tcb, tcg, tcw,
              TCB_STRETCH, TCG_STRETCH, TCW_STRETCH,
              chip_file)

def extract_region_spectral(spectral_file, tc_file, cloud_file, x, y, width=5):
    spectrals = []
    refl = read_spectral(spectral_file, x, y, width, width)
    #import pdb; pdb.set_trace()
    for i in [0,1,2,3,4,5]: #refl.shape[0]:
	 #range(refl.ndim):
        this_band = refl[i]
        spectrals.append('|'.join(map(str, this_band.flatten())))

    tc = read_spectral(tc_file, x, y, width, width)
    for i in [0,1,2]:	# refl.shape[0]: 
	#range(tc.ndim):
        this_band = tc[i]
        spectrals.append('|'.join(map(str, this_band.flatten())))
    #import pdb; pdb.set_trace()
    cloud = read_spectral(cloud_file, x, y, width, width)
    spectrals.append('|'.join(map(str, cloud.flatten())))
    spectrals.append(str(100-int(numpy.mean(cloud.flatten()*100))))

    spectrals.append('10000')

    return ','.join(spectrals)

#
# TODO: optimization is needed to improve performance on I/O
#
def harvest_chip(tsa, sample_file, image_list_file, chip_dir, project_id):

    this_path = tsa/1000
    this_row = tsa - this_path * 1000

    #OLD version: "OBJECTID_1","plotid","MR","pathrow","x","y","lat","lng"
    #consistent with import version: project_id, tsa, plotid, x, y, lat, long, dist_year, sequence_order

    inf = open(sample_file, 'r')
    samples = inf.readlines()
    inf.close()

    #Old verion: TM,2011,205,refl,tc,cloud
    #consistent version: project_id, tsa, imgtype, imgyear imgdy, reflfile, tcfile, cloudfile

    inf = open(image_list_file, 'r')
    image_list = inf.readlines()
    inf.close()

    #ts_pprr
    chip_output_dir = os.path.join(chip_dir, 'ts_{0}{1}'.format(this_path, this_row))
    if not os.path.exists(chip_output_dir):
        os.mkdir(chip_output_dir)

    spectral_file = os.path.join(chip_output_dir, 'ts_{0}{1}_spectral.csv'.format(this_path, this_row))
    spfh = open(spectral_file, 'w')

    for samp in samples[1:]:
        this_sample = samp.strip().split(',')
	this_projectid=this_sample[0]
        this_tsa = int(this_sample[1])
	this_plot = this_sample[2]
        
        this_x = float(this_sample[3])
        this_y = float(this_sample[4])

        print 'Processing {0} - {1}'.format(this_tsa, this_plot)

        #ts_pprr/plot_id
        this_chip_dir = 'ts_{0}{1}/plot_{2}'.format(this_path, this_row, this_plot.strip())
        this_chip_dir = os.path.join(chip_dir, this_chip_dir)
        if not os.path.exists(this_chip_dir):
            os.mkdir(this_chip_dir)

        spec_str = ''
        for il in image_list[1:]:
            these_files = il.strip().split(',')
	    print these_files[1]
	    #skip over the project ID in first column
            this_platform = these_files[2]
            this_year = these_files[3]
            this_day = these_files[4]
            refl = these_files[5]
            tc = these_files[6]
            cloud = these_files[7]

            #print '\t{0}-{1}'.format(this_year, this_day)
	    #import pdb ; pdb.set_trace()
            spectral = extract_region_spectral(refl, tc, cloud, this_x, this_y)
            head = '{0},{1},{2},TM,{3},{4},'.format(this_projectid, this_plot, this_tsa, this_year, this_day)
            spectral = head + spectral + '\n'

            spec_str = spec_str + spectral

            this_chip = 'tsa_{0}{1}_plot_{2}_{3}-{4}.png'.format(this_path, this_row, this_plot.strip(), this_year.strip(), this_day.strip())
            chip_file = os.path.join(this_chip_dir, this_chip)

            create_chip(tc, this_x, this_y, 255, 255, chip_file)

        spfh.writelines(spec_str)
    spfh.close()

if __name__ == '__main__':
    if len(sys.argv) != 6:
        print '''usage: python extract_chip.py tsa sample_file image_list chip_dir project_id

        where tsa: scene name as int, e.g. 44031
              sample_file: plot location
              image_list: list of images to use
              chip_dir: chip output directory
	      project_id:   id for lt label interface
        '''
    else:
        harvest_chip(int(sys.argv[1]),sys.argv[2],sys.argv[3],sys.argv[4], sys.argv[5])

