

pro mask_fixer, vctmask, itmask, outfile

  print, "processing: "
  for i=0, n_elements(vctmask)-1 do begin
    print, " ",vctmask[i]
    ;---find the subset--
    zot_img, vctmask[i], vcthdr, vctimg, /hdronly
    zot_img, itmask[i], ithdr, itimg, /hdronly
    ulx = max([vcthdr.upperleftcenter[0], ithdr.upperleftcenter[0]])
    uly = min([vcthdr.upperleftcenter[1], ithdr.upperleftcenter[1]])
    lrx = min([vcthdr.lowerrightcenter[0], ithdr.lowerrightcenter[0]])
    lry = max([vcthdr.lowerrightcenter[1], ithdr.lowerrightcenter[1]])
    
    subset = [[ulx,uly],[lrx,lry]]
    
    ;---combine the two masks
    zot_img, vctmask[i], vcthdr, vctimg, subset=subset
    zot_img, itmask[i], ithdr, itimg, subset=subset
    
    vctimg = vctimg eq 0
    itimg = itimg eq 0
    
    outimg = fix(vctimg*itimg)
    outimg[where(outimg eq 0)] = 2500
    outimg[where(outimg eq 1)] = 0
    
    
    ;---write out the cloudmask---
    openw, un, outfile[i], /get_lun
    writeu, un, outimg
    free_lun, un
    write_im_hdr, outfile[i], vcthdr
  endfor
end

