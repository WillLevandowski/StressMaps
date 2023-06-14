
gmt begin AKCrustalPaxes  png
gmt gmtset MAP_FRAME_TYPE inside
    gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
 gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,forestgreen
  gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin

#   gmt psxy MannWindow.txt  -Wthick,purple
  gmt psxy All_AKPaxes  -SV0.5+jc   -CPaxes5.cpt  -Wthinnest+cl 
   gmt gmtset MAP_FRAME_TYPE plain
 gmt gmtset FONT_ANNOT_PRIMARY 12p,Helvetica-Bold
     gmt gmtset FONT_ANNOT_SECONDARY 12p,Helvetica-Bold
     gmt gmtset FONT_LABEL 12p,Helvetica-Bold
 
      gmt psscale -Dx10.2c/1.7c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"Pseudo-A@~f@~" 

gmt end show 

gmt begin AKSmoothCrustalPaxes  png
gmt gmtset MAP_FRAME_TYPE inside
gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,dimgray
    gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
 # gmt grdimage @earth_relief_05m -I-0.85
#      gmt coast -R-175.99/44/-100/67r  -Gdarkgray -Cgray -Da -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,yellow
 gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,forestgreen
  gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin
  gmt psxy smoothPaxes.txt  -SV0.5+jc   -CPaxes5.cpt  -Wthinner+cl 
   gmt gmtset MAP_FRAME_TYPE plain
  gmt gmtset FONT_ANNOT_PRIMARY 12p,Helvetica-Bold
     gmt gmtset FONT_ANNOT_SECONDARY 12p,Helvetica-Bold
     gmt gmtset FONT_LABEL 12p,Helvetica-Bold
 
      gmt psscale -Dx10.2c/1.7c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"Pseudo-A@~f@~" 

gmt end show 

gmt begin AKSmootherCrustalPaxes  png
gmt gmtset MAP_FRAME_TYPE inside
gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,dimgray
    gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
#  gmt grdimage @earth_relief_05m -I-0.85
#      gmt coast -R-175.99/44/-100/67r  -Gdarkgray -Cgray -Da -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,yellow
 gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,forestgreen
  gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin
  gmt psxy smootherPaxes.txt  -SV0.5+jc   -CPaxes5.cpt  -Wthinner+cl 
   gmt gmtset MAP_FRAME_TYPE plain
  gmt gmtset FONT_ANNOT_PRIMARY 12p,Helvetica-Bold
     gmt gmtset FONT_ANNOT_SECONDARY 12p,Helvetica-Bold
     gmt gmtset FONT_LABEL 12p,Helvetica-Bold
 
      gmt psscale -Dx10.2c/1.7c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"Pseudo-A@~f@~" 

gmt end show 


gmt begin AKGridCrustalPaxes  png
gmt gmtset MAP_FRAME_TYPE inside
gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,dimgray
    gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
#  gmt grdimage @earth_relief_05m -I-0.85
#      gmt coast -R-175.99/44/-100/67r  -Gdarkgray -Cgray -Da -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,yellow
 gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,forestgreen
  gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin
  gmt psxy smoothPaxesgrid.txt  -SV0.5+jc   -CPaxes5.cpt  -Wthinner+cl 
   gmt gmtset MAP_FRAME_TYPE plain
  gmt gmtset FONT_ANNOT_PRIMARY 12p,Helvetica-Bold
     gmt gmtset FONT_ANNOT_SECONDARY 12p,Helvetica-Bold
     gmt gmtset FONT_LABEL 12p,Helvetica-Bold
 
      gmt psscale -Dx10.2c/1.7c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"Pseudo-A@~f@~" 

gmt end show 
