#!/net/usr/local/bin/python
import sys
sys.path.append("/projectnb/trenders/code/py/")
from ledaps_handler import *

ledaps_path = '/net/nfs-offsite-c1/ifs/noreplica/project/trenders/scenes/043027/P043-R027'
output_path = '/net/nfs-offsite-c1/ifs/noreplica/project/trenders/scenes/043027/images'
proj_file_path = '/projectnb/trenders/code/py/albers.txt'
tmp_path = '/net/nfs-offsite-c1/ifs/noreplica/project/trenders/scenes/043027/images/tmp'


#extract reflectance from ledaps hdf

processLedaps(ledaps_path, output_path, proj_file_path, tmp_path)


#create tc image for reflectance image
processIcetrendrTC(output_path)

#convert fmask to icetrendr mask
processFmask(ledaps_path, output_path, proj_file_path)
