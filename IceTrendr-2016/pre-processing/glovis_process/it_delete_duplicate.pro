;this program will delete a file if it exists, but retain the meta data file

;example: checkfile = IT5025028_1984_182_20110927_152849_cloudmask.bsq  - check files pulls out only this part "IT5025028_1984_182"
;         turn on the keyword for the output file you are working with

pro it_delete_duplicate, checkfile, cloudmask=cloudmask, radnorm=radnorm, $
    b6thermal=b6thermal, archv=archv, radref=radref, tcimg=tcimg, pcaimg=pcaimg, $
    vct_usearea=vct_usearea, cloudmsktif=cloudmsktif
    
  allem = [keyword_set(cloudmask),$
    keyword_set(radnorm),$
    keyword_set(b6thermal),$
    keyword_set(archv),$
    keyword_set(radref),$
    keyword_set(tcimg),$
    keyword_set(vct_usearea),$
    keyword_set(cloudmsktif)]
    
  for i=0, n_elements(allem)-1 do begin
    if allem[i] eq 1 then begin
      if i eq 0 then matchthis = 'cloudmask'
      if i eq 1 then matchthis = '_to_'
      if i eq 2 then matchthis = 'b6'
      if i eq 3 then matchthis = 'archv'
      if i eq 4 then matchthis = 'radref'
      if i eq 5 then matchthis = 'itc'
      if i eq 6 then matchthis = 'vct_usearea'
      if i eq 7 then matchthis = 'cloudmask.tif'
      
      filedir = file_dirname(checkfile)+"\"
      searchfor = strmid(file_basename(checkfile), 0, 18)
      searchfor = strcompress("*"+searchfor+"*"+matchthis+"*", /rem)
      existfiles = file_search(filedir, searchfor, count=n_existfiles)
      if n_existfiles ge 1 then begin
        existfilesgood = where(strmatch(existfiles, "*meta.txt") ne 1, n_existfilesgood)
        if n_existfilesgood ge 1 then begin
          existfiles = existfiles[existfilesgood]
          file_delete, existfiles
        endif
      endif
    endif
  endfor
end
