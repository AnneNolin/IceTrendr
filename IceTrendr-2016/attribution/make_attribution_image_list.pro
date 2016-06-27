;****************************************************************************
;Copyright © 2008-2011 Oregon State University
;All Rights Reserved.
;
;
;Permission to use, copy, modify, and distribute this software and its
;documentation for educational, research and non-profit purposes, without
;fee, and without a written agreement is hereby granted, provided that the
;above copyright notice, this paragraph and the following three paragraphs
;appear in all copies.
;
;
;Permission to incorporate this software into commercial products may be
;obtained by contacting Oregon State University Office of Technology Transfer.
;
;
;This software program and documentation are copyrighted by Oregon State
;University. The software program and documentation are supplied "as is",
;without any accompanying services from Oregon State University. OSU does not
;warrant that the operation of the program will be uninterrupted or
;error-free. The end-user understands that the program was developed for
;research purposes and is advised not to rely exclusively on the program for
;any reason.
;
;
;IN NO EVENT SHALL OREGON STATE UNIVERSITY BE LIABLE TO ANY PARTY FOR DIRECT,
;INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST
;PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
;IF OREGON STATE UNIVERSITYHAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
;DAMAGE. OREGON STATE UNIVERSITY SPECIFICALLY DISCLAIMS ANY WARRANTIES,
;INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
;FITNESS FOR A PARTICULAR PURPOSE AND ANY STATUTORY WARRANTY OF
;NON-INFRINGEMENT. THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
;AND OREGON STATE UNIVERSITY HAS NO OBLIGATIONS TO PROVIDE MAINTENANCE,
;SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
;
;****************************************************************************
;
;Note 'scene_path' variable should include a trailing slash ('\' for Windows, '/' for Unix)
PRO make_attribution_image_list, tsa, scene_path, project_id

;This procedure finds files for IceTrendr attribution chip harvesting,
;then creates an image list formatted for use in the Python chip harvesting routine
;
;Which way does the slash go?
slash=path_sep()

;Which scene are we processing?
tsa=STRTRIM(tsa) ;This should be a number but passed as a string

;Where is this scene located?
scene_path=scene_path
  images_path=scene_path+'images'+slash
  print, 'Looking for the image_info_savefile here: '+images_path

;Which project/glacier does this attribution image list belong?
project_id=STRTRIM(project_id) ;This should be a number but passed as a string

;Create CSV filename and header line
filename=tsa+'_project'+project_id+'_attribution_image_list.csv'
csv_file=scene_path+'images'+slash+filename
csv_header=['project_id', 'tsa', 'imgtype', 'imgyear', 'imgdy', 'reflfile', 'tcfile', 'cloudfile']

;Use image_info_savefile created during automated segmentation if available 
test=file_exists(image_info_savefile)
image_info_savefile = file_search(images_path, '*image_info*.sav')
IF file_exists(image_info_savefile) eq 1 THEN BEGIN 
  ;First, get the image_info_savefile into memory
    restore, image_info_savefile
  ;Then, count the number of images...
    count_image_files =n_elements(image_info) 
  ;Next, create pieces for image list (imgtype, imgyear imgdy, reflfile, tcfile, cloudfile)
  ;  Need to have arrays of the same size to be able to write CSV 
    project_id_array = MAKE_ARRAY(count_image_files, VALUE=project_id, /STRING)
    tsa_array = MAKE_ARRAY(count_image_files, VALUE=tsa, /STRING)
    imgtype_array = MAKE_ARRAY(count_image_files, VALUE='TM', /STRING)
    imgyear = STRTRIM(image_info.year,2) ;need to convert number to string
    imgdy = STRTRIM(image_info.julday,2) ;need to convert number to string
    reflfile =image_info.image_file 
    tcfile=image_info.tc_file 
    cloudfile=image_info.cloud_file 
  ;write to *.CSV file
    Write_CSV, csv_file, $
      project_id_array, tsa_array, imgtype_array, imgyear, imgdy, reflfile, tcfile, cloudfile, $
    HEADER=csv_header
END
;Let user know it finished
print, ' '
count=STRTRIM(n_elements(image_info), 2)
print, 'There were '+count+' images found'
print, 'COMPLETED making attribute image list! It is located at: '+csv_file

END
