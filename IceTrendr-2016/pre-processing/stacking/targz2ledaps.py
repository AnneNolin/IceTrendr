#!/usr/bin/python

import os
import re
import sys
import glob
import struct
import gdal

from numpy import *
from ledaps_handler2 import *

#targz_path = '/mnt/IceTrendr/scascade/scenes/targz/'
#output_path = '/mnt/IceTrendr/scascade/scenes/images/'
#proj_file_path = '/mnt/IceTrendr/code/IceTrendr-2012/pre-processing/stacking/albers.txt'

#mask_snow = False 
#tc_type = 'sr'

# Create tmp directory for extracted tar.gz files
cmdargs = sys.argv
error = 0
try:
    usage = cmdargs.index('-h')
    print("Usage: targz2ledaps.py -i targz_path -o outdir_path -p projection_path&filename [-s] [-tc type] [-h]")
    print("\t -s  do not mask snow in cfmask")
    print("\t -tc type = 'sr' or 'toa'")
    print("\t -h  print usage")
    print("\n\tThis program unarchive targz files in a temp directory under targz_path and creates *_(year)_(*day)_ledaps.bsq, *_(year)_(day)_cfmask.bsq, and *_(year)_(day)_tc.bsq and puts them in outdir_path/year.") 
    print("\n\tThe projection file is used to create _ledaps.bsq and _cfmask.bsq.")
    print("\n\t'-i', '-o', and '-p' paths/filename are required.")
    print("\n\tThe '-s' option allows for snow identified in the ledaps cfmask file to be excluded when the cloudmask is created. The default is for snow to be masked along with cloud, shadow, and L7 scanline pixels in the output cloudmask.")
    print("\n\tThe '-tc type' option is used to specify the type of TasselCap coefficient to use. Only two types are possible: 'sr' or 'toa'. The default is type='sr'.")
    error = 1
except ValueError:
    try:
        targz_path = cmdargs.index('-i')
        targz_path = cmdargs[cmdargs.index('-i') + 1]
    except ValueError:
        error = 1
        print("Error: Missing '-i' - directory to targz files!")

    try:
        output_path = cmdargs.index('-o')
        output_path = cmdargs[cmdargs.index('-o') + 1]
    except ValueError:
        error = 1
        print("Error: Missing '-o' - output directory!")

    try:
        proj_file_path = cmdargs.index('-p')
        proj_file_path = cmdargs[cmdargs.index('-p') + 1]
    except ValueError:
        error = 1
        print("Error: Missing '-p' - projection path and filename!")

    try:
        cmdargs.index('-s')
        print("Not masking snow in cfmask")
        mask_snow = False
    except ValueError:
        mask_snow = True
        print("Masking snow in cfmask")

    try:
        tc_type = cmdargs.index('-tc')
        if (cmdargs[cmdargs.index('-s') + 1] == 'sr') or (cmdargs[cmdargs.index('-s') + 1] == 'toa'):
	    tc_type = cmdargs[cmdargs.index('-s') + 1]
        else:
	    error = 1
	    print("Error: Allowable TasselCap coefficient types are 'sr' or 'toa'") 
    except ValueError: #default
        print("Using TasselCap 'sr' coefficients.")
        tc_type = 'sr'

if (not error):
    tmp_path = ''
    if len(tmp_path)==0:
        tmp_path = os.path.join(targz_path, "tmp")
        if not os.path.exists(tmp_path):
	    os.mkdir(tmp_path)

    # unarchive geotiff files in ledaps_path
    targz_files = glob.glob(targz_path + '*.tar.gz')
    targz_files = sorted(targz_files)
    cmd = 'tar -xvf {0} -C {1}'

    for targz in targz_files:
        if (targz.find('statistics') > 0): continue
        os.system(cmd.format(targz, tmp_path))


        #extract reflectance from ledaps geotif
        processLedaps2(tmp_path, output_path, proj_file_path)

        #create tc image for reflectance image
        processIcetrendrTC2(tmp_path, output_path, tc_type)

        #convert fmask to icetrendr mask
        processFmask2(tmp_path, output_path, proj_file_path, mask_snow)

        os.system('rm -rf ' + tmp_path + '/*') 

