#!/bin/tcsh
#$ -pe omp 1
#$ -l h_rt=24:00:00
#$ -N ext046030
#$ -V
module load python/2.7.5
module load gdal/1.10.0
python extract_chip_rek.py 46030 /projectnb/trenders/proj/itattribution/mr224_fast/val1/IT_v2.00_nbr_046030_paramset01_20130301_225736_greatest_fast_disturbance_mmu11_tight_patchinfo_proj30.csv /projectnb/trenders/proj/itattribution/mr224_fast/val1/IT_v2.00_nbr_046030_paramset01_20130301_225736_greatest_fast_disturbance_mmu11_tight_patchinfo_image_list_proj30.csv /projectnb/trenders/proj/itattribution/mr224_fast/val1/ 30
wait
