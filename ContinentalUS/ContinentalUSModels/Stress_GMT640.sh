



gmt begin PorcupinePlot png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
 gmt gmtset FONT_ANNOT_PRIMARY Helvetica-Bold,16p
   gmt coast -R-126/-56/25/50 -Gdarkgray  -Da -Sgray -Ba10 -N1/thick,dimgray -N2/faint,dimgray -JM8.5i
       gmt psxy PorcupineModel_DistanceWeightedInversions.txt  -SV0.5+jc  -CPaxes3.cpt  -Wthick+cl 

#  gmt psscale -Dx16.7c/1.5c+w8c/0.5c+jBC+mr+h -CPaxes4.cpt -By+l"A@~f@~" -Ba0.5
gmt end show # end will finish the plots and open them in a viewer



# gmt begin FIGURE22 png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica-Bold,16p
#    gmt coast -R-126/-66/25/50 -Gdarkgray  -Da -Sgray -Ba10 -N1/thick,dimgray -N2/faint,dimgray -JM8.5i
# gmt psxy FM_Paxes  -SV0.5+jc  -CPaxes3.cpt  -Wthin+cl
# gmt triangulate -R-126/-66/25/50 AphiGridVecMay2023 -I2k   -Gtemp.nc
#  gmt grdimage temp.nc  -I-0 -CPaxesEZ.cpt  
#   gmt psxy AllProvsthinnest3_May2023  -SV0.5+jc   -Callgray.cpt  -Wfaint+cl
# gmt psxy AllProvsthinner3_May2023  -SV0.5+jc  -Callgray.cpt   -Wthinnest+cl
# gmt psxy AllProvsthin3_May2023  -SV0.5+jc   -Callgray.cpt  -Wthinner+cl
# gmt psxy AllProvsthick3_May2023  -SV0.5+jc -Callgray.cpt   -Wthin+cl
#   gmt psxy LundSneeZobackWSM_AtoC.txt  -SV0.5+jc  -Callblack.cpt  -Wthin+cl
# gmt gmtset MAP_FRAME_TYPE plain
# gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14p
#  gmt psscale -Dx16.7c/1.5c+w8c/0.5c+jBC+mr+h -CPaxesEZ.cpt -By+l"A@~f@~" -Ba0.5 
# gmt end show #
