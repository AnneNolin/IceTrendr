#********************************************************
# create_ledaps_tc: create tasseled cap image from ledaps 
#   extracted reflectance image
#
# Author: Yang Z.
# Usage:  create_ledaps_tc.py image_path
# 
#********************************************************
import os
import sys
import numpy
from numpy import *
from osgeo import gdal
from osgeo import gdalconst

def create_ledaps_tc(refl_file, tc_file):
    """convert reflectance image to tasseled cap image"""
    
    brt_coeffs = [0.2043, 0.4158, 0.5524, 0.5741, 0.3124, 0.2303]
    grn_coeffs = [-0.1603, -0.2819, -0.4934, 0.7940, -0.0002, -0.1446]
    wet_coeffs = [0.0315, 0.2021, 0.3102, 0.1594,-0.6806, -0.6109]
    
    all_coeffs = [[brt_coeffs], [grn_coeffs], [wet_coeffs]]
    all_coeffs = matrix(array(all_coeffs))
    
    
    #open qa file for readonly access
    dataset = gdal.Open(refl_file, gdalconst.GA_ReadOnly)
    if dataset is None:
        print("failed to open " + refl_file)
        return 1
    
    #create output image
    tc = dataset.GetDriver().Create(tc_file, dataset.RasterXSize, dataset.RasterYSize, 3, gdalconst.GDT_Int16)
    tc.SetGeoTransform(dataset.GetGeoTransform())
    tc.SetProjection(dataset.GetProjection())
    
    for y in range(dataset.RasterYSize):
        if y % 100 == 0:
            print "line " + str(y+1)
        refl = dataset.ReadAsArray(0, y, dataset.RasterXSize, 1)
        refl[refl==-9999] = 0
        tcvals = int16(all_coeffs * matrix(refl))
        
        tc.GetRasterBand(1).WriteArray(tcvals[0,:], 0, y)
        tc.GetRasterBand(2).WriteArray(tcvals[1,:], 0, y)
        tc.GetRasterBand(3).WriteArray(tcvals[2,:], 0, y)
        
    dataset = None
    tc = None
    
    print "Done"

def tc_all(imgdir):
    for root, dirs, files in os.walk(imgdir):
        print("root = " + root)
        for name in files:
            if name.endswith('archv.bsq'):
                print(os.path.join(root, name))
                create_ledaps_tc(os.path.join(root, name), os.path.join(root, name.replace('archv.bsq', 'tc.bsq')))
        for name in dirs:
            tc_all(name)


def main(argv):
    usage = """
         usage: create_ledaps_tc.py image_path
            
            image_path: full directory name to where ledaps reflectance files are 
            
            """
    if len(argv) < 2:
        print(usage)
    else:
        tc_all(argv[1])

if __name__ == "__main__":
    main(sys.argv)
