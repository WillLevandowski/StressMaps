
gmt begin AllPaxes png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
 gmt gmtset FONT_ANNOT_PRIMARY Helvetica-Bold,16p
   gmt coast -R-126/-56/25/50 -Gdarkgray  -Da -Sgray -Ba10 -N1/thick,dimgray -N2/faint,dimgray -JM8.5i
  gmt psxy LundSneeZobackWSM_AtoC.txt  -SV0.5+jc  -Callblack.cpt  -Wthin+cl
gmt psxy FM_Paxes  -SV0.5+jc  -CPaxes3.cpt  -Wthin+cl
gmt end show # end will finish the plots and open them in a viewer

gmt begin SmoothPaxes png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
 gmt gmtset FONT_ANNOT_PRIMARY Helvetica-Bold,16p
   gmt coast -R-126/-56/25/50 -Gdarkgray  -Da -Sgray -Ba10 -N1/thick,dimgray -N2/faint,dimgray -JM8.5i
  gmt psxy LundSneeZobackWSM_AtoC.txt  -SV0.5+jc  -Callblack.cpt  -Wthin+cl
gmt psxy smootherCEUS_Paxes  -SV0.5+jc  -CPaxes3.cpt  -Wthin+cl
gmt end show # end will finish the plots and open them in a viewer

