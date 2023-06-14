





gmt begin Alaska_ZoneInversion  png
gmt gmtset MAP_FRAME_TYPE plain
      gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba5g5 -N1/thicker,dimgray -N2/thin,dimgray -JA-145/62/50/7.5i
 gmt grdimage @earth_relief_05m -I-0.85
       gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Cgray -Ba5g5 -N1/thicker,dimgray -N2/thin,dimgray -JA-145/62/50/7.5i
  gmt psxy ZoneVertices.txt  -Wfaint
  gmt psxy AKZones_lowmin  -SV0.5+jc   -Cblack.cpt  -Wthick+cl 
    gmt psxy AKZones_highmax  -SV0.5+jc  -Cblack.cpt  -Wthick+cl 
       gmt psxy AKZones  -SV0.5+jc  -CPaxes3.cpt  -Wthick+cl 
        gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,white
     gmt gmtset FONT_ANNOT_SECONDARY 16p,Helvetica-Bold,white
     gmt gmtset FONT_LABEL 16p,Helvetica-Bold,white
    gmt psscale -Dx10.2c/1.2c+w3.5c/0.5c+jTC+h+ml -CPaxes3.cpt -Ba1+l"A@~f@~" 
gmt end show 





