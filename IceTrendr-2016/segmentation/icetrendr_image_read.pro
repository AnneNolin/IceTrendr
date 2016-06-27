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

pro icetrendr_image_read, image_info_for_this_year, hdr, img, subset, index, modifier, background_val

	;image_info_for_this_year if the image info structure for the year of
	;   interest only, based on the structure set up
	;  in set_up_files_icetrendr....

	;hdr and img will be filled with header and image, respectively, as with
	;  zot_img

	;subset is the geographic subset, as would be passed to zot_img

	;index is a string that defines any of a number of
	;  combinations of bands, etc. used by icetrendr
	;  New ones can be made within this function
	;  Pass back a pointer to the image
	;  SI3 (Snow Index ratio 1: Band3/Band5)...Paul et al. (2007)
	;  NDGI3 (Normalized Difference Glacier Index: (Band3-Band5)/(Band3+Band5)... 
  ;  SI4 (Snow Index ration 2: Band4/Band5)...Jacobs et al. (1997), Paul et al. (2002)
	;  NDGI4 (Normalized Difference Glacier Index: (Band4-Band5)/(Band4+Band5)... 
  ;  NDGI2 (Normalized Difference Glacier Index: (Band2-Band5)/(Band2+Band5)...renamed from the Normalized Difference Snow Index of Hall et al. (1995)
  ;  Band5
	;  wetness
	;  NBR
	;  TCangle
	;  NDVI

mastersubset = subset
image_info = image_info_for_this_year

if n_elements(image_info) gt 1 then begin
   message, "icetrend_image_read:  image info should already be subsetted to single year"
   return
end


tempindex = strupcase(index)

case 1 of
(tempindex eq 'BAND1'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'

					   zot_img, image_info.image_file, hdr, img, subset=subset, layer = [1]

						modifier = 1
					  end
(tempindex eq 'BAND2'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'

					   zot_img, image_info.image_file, hdr, img, subset=subset, layer = [2]

						modifier = 1
					  end
(tempindex eq 'BAND3'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'

					   zot_img, image_info.image_file, hdr, img, subset=subset, layer = [3]

						modifier = 1
					  end
(tempindex eq 'BAND4'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'

					   zot_img, image_info.image_file, hdr, img, subset=subset, layer = [4]

						modifier = -1
					  end
(tempindex eq 'BAND5'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'

					   zot_img, image_info.image_file, hdr, img, subset=subset, layer = [5]

						modifier = 1
					  end
(tempindex eq 'BAND7'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'

					   zot_img, image_info.image_file, hdr, img, subset=subset, layer = [6]

						modifier = 1
					  end

(tempindex eq 'SI3'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img1, subset=subset, layer = [3]
						subset = mastersubset
						zot_img, image_info.image_file, hdr, img2, subset=subset, layer = [5]
						background_pixels = where(img1 eq background_val, nbg)
					  	img = fix(img1)
						goods = where(img1+img2 ne 0, ngoods)
						if ngoods gt 0 then img[goods] = $
								100*(float(img1[goods])/ $
										(img2[goods]))
						if nbg ne 0 then img[background_pixels] = background_val		;reset background val
						modifier = -1
					  end

(tempindex eq 'SI4'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img1, subset=subset, layer = [4]
						subset = mastersubset
						zot_img, image_info.image_file, hdr, img2, subset=subset, layer = [5]
						background_pixels = where(img1 eq background_val, nbg)
					  	img = fix(img1)
						goods = where(img1+img2 ne 0, ngoods)
						if ngoods gt 0 then img[goods] = $
								100*(float(img1[goods])/ $
										(img2[goods]))
						if nbg ne 0 then img[background_pixels] = background_val		;reset background val
						modifier = -1
					  end

(tempindex eq 'NDGI2'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img1, subset=subset, layer = [2]
						subset = mastersubset
						zot_img, image_info.image_file, hdr, img2, subset=subset, layer = [5]
						background_pixels = where(img1 eq background_val, nbg)
					  	img = fix(img1)
						goods = where(img1+img2 ne 0, ngoods)
						if ngoods gt 0 then img[goods] = $
								1000*(float(img1[goods])-img2[goods])/ $
										(img1[goods]+img2[goods])
						if nbg ne 0 then img[background_pixels] = background_val		;reset background val
						modifier = -1
					  end
(tempindex eq 'NDGI3'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img1, subset=subset, layer = [3]
						subset = mastersubset
						zot_img, image_info.image_file, hdr, img2, subset=subset, layer = [5]
						background_pixels = where(img1 eq background_val, nbg)
					  	img = fix(img1)
						goods = where(img1+img2 ne 0, ngoods)
						if ngoods gt 0 then img[goods] = $
								1000*(float(img1[goods])-img2[goods])/ $
										(img1[goods]+img2[goods])
						if nbg ne 0 then img[background_pixels] = background_val		;reset background val
						modifier = -1
					  end
(tempindex eq 'NDGI4'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img1, subset=subset, layer = [4]
						subset = mastersubset
						zot_img, image_info.image_file, hdr, img2, subset=subset, layer = [5]
						background_pixels = where(img1 eq background_val, nbg)
					  	img = fix(img1)
						goods = where(img1+img2 ne 0, ngoods)
						if ngoods gt 0 then img[goods] = $
								1000*(float(img1[goods])-img2[goods])/ $
										(img1[goods]+img2[goods])
						if nbg ne 0 then img[background_pixels] = background_val		;reset background val
						modifier = -1
					  end

(tempindex eq 'NBR'):   begin
						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img1, subset=subset, layer = [4]
						subset = mastersubset
						zot_img, image_info.image_file, hdr, img2, subset=subset, layer = [6]
						background_pixels = where(img1 eq background_val, nbg)
					  	img = fix(img1)
						goods = where(img1+img2 ne 0, ngoods)
						if ngoods gt 0 then img[goods] = $
								1000*(float(img1[goods])-img2[goods])/ $
										(img1[goods]+img2[goods])
						if nbg ne 0 then img[background_pixels] = background_val		;reset background val
						modifier = -1
					  end

(tempindex eq 'WETNESS'):   begin
						if (file_exists(image_info.tc_file) eq 0) then message, image_info.tc_file + 'does not exist'
						zot_img, image_info.tc_file, hdr, img, subset=subset, layer = [3]

						modifier = -1

					  end

(tempindex eq 'BRIGHTNESS'):   begin
						if (file_exists(image_info.tc_file) eq 0) then message, image_info.tc_file + 'does not exist'
						zot_img, image_info.tc_file, hdr, img, subset=subset, layer = [1]

						modifier = 1

					  end
(tempindex eq 'GREENNESS'):   begin
						if (file_exists(image_info.tc_file) eq 0) then message, image_info.tc_file + 'does not exist'
						zot_img, image_info.tc_file, hdr, img, subset=subset, layer = [2]

						modifier = -1

					  end


(tempindex eq 'TCANGLE'):   begin
						if (file_exists(image_info.tc_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.tc_file, hdr, img1, subset=subset, layer = [1]	 ;brt
						subset = mastersubset
						zot_img, image_info.tc_file, hdr, img2, subset=subset, layer = [2]  ;grn
						background_pixels = where(img1 eq background_val, nbg)
						img = fix(img1)
						goods = where(img1 ne 0, ngoods)

						if (ngoods gt 0) then img[goods] = 	atan(float(img2[goods])/img1[goods])*!radeg*10
						if nbg ne 0 then img[background_pixels] = background_val		;reset background val

						modifier = -1

					  end


(tempindex eq 'DISTINDEX'):   begin 
						if (file_exists(image_info.tc_file) eq 0) then message, image_info.image_file + 'does not exist'
						subset=mastersubset
						zot_img, image_info.tc_file, hdr, img1, subset=subset, layer = [1]       ;brt
                                                subset = mastersubset
                                                zot_img, image_info.tc_file, hdr, img2, subset=subset, layer = [2]  ;grn
                                                subset=mastersubset
						zot_img, image_info.tc_file, hdr, img3, subset=subset, layer =[3]	;wet
	


						background_pixels = where(img1 eq background_val, nbg)
                                                img = fix(img1)
                                                goods = where(img1 ne 0, ngoods)

                                                if (ngoods gt 0) then img[goods] =   img1[goods]-img2[goods]-img3[goods]
                                                if nbg ne 0 then img[background_pixels] = background_val                ;reset background val

						modifier = 1
				end





(tempindex eq 'NDVI'):   begin
					if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img1, subset=subset, layer = [4]
					    img1 = fix(img1)
            subset = mastersubset
						zot_img, image_info.image_file, hdr, img2, subset=subset, layer = [3]

						background_pixels = where(img1 eq background_val, nbg)
						img2 = fix(img2)

						img = img1
						goods = where(img1+img2 ne 0, ngoods)

						if ngoods gt 0 then begin
							diff = float(img1[goods]-img2[goods])
							sum = img1[goods]+img2[goods]

							img1=0
							img2=0
							ndvi = diff/sum
							diff=0
							sum=0

							img[goods] = 1000*ndvi
						end

						if nbg ne 0 then img[background_pixels] = background_val		;reset background val

						modifier = -1
					  end

 (tempindex eq 'BIOMASS'):  begin
 						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img, subset=subset, layer = [1]
						modifier = -1
						end

 (tempindex eq 'PROBFOR'):  begin
 						if (file_exists(image_info.image_file) eq 0) then message, image_info.image_file + 'does not exist'
						zot_img, image_info.image_file, hdr, img, subset=subset, layer = [1]
						modifier = -1
						end







else: message, 'Index not recognized. Options are NDGI2,NDGI3, NDGI4, BANDS 1-7, brightness, greenness, wetness, SI1, SI2, NBR, NDVI, tcangle, biomass, probfor'
endcase

return

end

