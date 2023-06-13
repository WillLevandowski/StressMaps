
# gmt begin AK_AllMechs  png
# gmt gmtset MAP_FRAME_TYPE inside
# #     gmt coast -R-179.99/-110.01/51.01/71.99  -Gdarkgray  -Da -Sgray -Ba10 -N1/thicker -N2/faint -JA-145/62/25/12c
#     gmt coast -R-141.99/-140.01/59.41/60.99  -G90   -S120 -Ba1g1 -N1/thicker -N2/faint -JM3.5i
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#   gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin,orange
# 
# #   gmt psxy MannWindow.txt  -Wthick,purple
#   gmt psxy All_AKPaxes  -SV0.5+jc   -CPaxes5.cpt  -Wthinnest+cl 
# gmt end show 
# 
# gmt begin NEHRPFig1  png
# gmt gmtset MAP_FRAME_TYPE inside
# gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,dimgray
#     gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
#  gmt grdimage @earth_relief_05m -I-0.85
#      gmt coast -R-175.99/44/-100/67r  -Gdarkgray -Cgray -Da -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,yellow
#   gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin
#   gmt psxy smoothPaxes.txt  -SV0.5+jc   -CPaxes5.cpt  -Wthinner+cl 
# gmt end show 

# gmt begin AK_overview  png
# gmt gmtset MAP_FRAME_TYPE inside
# gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,dimgray
#     gmt coast -R-161.5/52/-120/70r  -Gdarkgray  -Da -Sgray -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# #     gmt coast -R-179.99/-110.01/47.01/71.99  -Gdarkgray  -Da -Sgray -Ba10 -N1/thicker,darkgreen -N2/faint,darkgreen -JM7.5i
#  gmt grdimage @earth_relief_30s
#      gmt coast   -Da -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray 
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,black
# #   gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin
# #   gmt psxy MannWindow.txt  -Wthick,purple
# #   gmt psxy smoothPaxes.txt  -SV0.5+jc   -Cblack.cpt  -Wthick+cl 
# #   gmt psxy smoothPaxes.txt  -SV0.5+jc   -CPaxes5.cpt  -Wthinner+cl 
# gmt end show 

# gmt begin AK_overviewzoom  png
# gmt gmtset MAP_FRAME_TYPE inside
# gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,dimgray
#     gmt coast -R-154/-141/59/64  -Gdarkgray  -Da -Sgray -Ba2g2 -N1/thicker,dimgray -N2/faint,dimgray -JM7.5i
# #     gmt coast -R-161.5/52/-120/70r  -Gdarkgray  -Da -Sgray -Ba10g10 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# #     gmt coast -R-179.99/-110.01/47.01/71.99  -Gdarkgray  -Da -Sgray -Ba10 -N1/thicker,darkgreen -N2/faint,darkgreen -JM7.5i
# # gmt makecpt -Cwhitebrown.cpt -T0/3000 -D 
#  gmt grdimage @earth_relief_30s -I-0.75
#      gmt coast  -Sgray -Da -Ba2g2 -N1/thicker,dimgray -N2/faint,dimgray 
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,black
# 
#      gmt psxy Mann25km.txt  -Wthickest,255/100/255,--
# #      gmt psxy Mann25km.txt  -Wthin,white,--
#      gmt psxy Mann50km.txt  -Wthickest,210/0/210,--
# #      gmt psxy Mann50km.txt  -Wthin,white,--
#      gmt psxy Mann100km.txt  -Wthickest,60/0/60,--
# #      gmt psxy Mann100km.txt  -Wthin,white,--
#         gmt psxy MannWindow.txt  -Wthicker,orange
# #   gmt psxy WSM_AtoC_Alaska.txt  -SV0.5+jc    -Wthin
# #   gmt psxy MannWindow.txt  -Wthick,purple
# #   gmt psxy smoothPaxes.txt  -SV0.5+jc   -Cblack.cpt  -Wthick+cl 
#   gmt psxy smootherPaxes.txt  -SV0.5+jc   -CPaxes5.cpt  -Wthinner+cl 
# #           gmt psxy locsCMT.txt  -Sc0.08 -Wfaint,green 
#           gmt psxy locs2023.txt  -Sc0.08 -Wfaint,green 
# gmt end show 

# gmt begin mantleseismicity  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE inside
#    gmt coast -R-179/-135/49.5/71  -Gdarkgray  -Da -Sgray -Ba10 -N1/thick -N2/faint -JM7.5i
# gmt makecpt -Cwhitebrown.cpt -T0/3000 -D 
#  gmt grdimage @earth_relief_30s -I-0
# #       gmt coast -R-179/-135/49.5/71  -Gdarkgray -Cgray -Ba10 -N1/thick -N2/faint -JM7.5i
#       gmt coast -R-179/-135/49.5/71  -Sgray -Ba10 -N1/thick -N2/faint -JM7.5i
#        gmt psxy AK_40to50kmM4.xyMz  -Sc0.1 -Wthin,255/0/255
#       gmt psxy AK_50to60kmM4.xyMz  -Sc0.1 -Wthin,210/0/210
#       gmt psxy AK_60to70kmM4.xyMz  -Sc0.1 -Wthin,170/0/170
#        gmt psxy AK_70to80kmM4.xyMz  -Sc0.1 -Wthin,140/0/140
#       gmt psxy AK_80to90kmM4.xyMz  -Sc0.1 -Wthin,110/0/110
#       gmt psxy AK_90to100kmM4.xyMz  -Sc0.1 -Wthin,70/0/70
# gmt psxy AK_100kmM4.xyMz  -Sc0.1 -Wthin,40/0/40
#      gmt psxy Mann25km.txt  -Wthickest,255/100/255
#      gmt psxy Mann25km.txt  -Wthin,white
#      gmt psxy Mann50km.txt  -Wthickest,210/0/210
#      gmt psxy Mann50km.txt  -Wthin,white
#      gmt psxy Mann100km.txt  -Wthickest,40/0/40
#      gmt psxy Mann100km.txt  -Wthin,white
#         gmt psxy MannWindow.txt  -Wthicker,84/130/53
# gmt end show



gmt begin gridResults5  png
 gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
gmt gmtset MAP_FRAME_TYPE plain
#    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JA-145/62/20/21c
#    gmt coast -R-150/50/-153/66r  -G90  -Ba5g5 -Di -Sgray  -N1/faint  -JOc-160/58/130/60/9i
       gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
     # gmt nearneighbor interpAphi_grid  -I5k -S100k  -Gtemp.nc -R-179.99/-110/47/72
# gmt grdimage temp.nc  -CPaxes3.cpt -Q
gmt grdimage @earth_relief_05m -I-0.85
       gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Cgray -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i

 gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
      gmt psxy AKPaxesgrid -SV0.15+jc  -CPaxes3.cpt  -Wthin+cl  -Baf 
    gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,white
     gmt gmtset FONT_ANNOT_SECONDARY 16p,Helvetica-Bold,white
     gmt gmtset FONT_LABEL 16p,Helvetica-Bold,white

    gmt psscale -Dx10.2c/1.2c+w3.5c/0.5c+jTC+h+ml -CPaxes3.cpt -Ba1
gmt end show


# gmt begin gridResults5  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE plain
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JA-145/62/20/21c
# #    gmt coast -R-150/50/-153/66r  -G90  -Ba5g5 -Di -Sgray  -N1/faint  -JOc-160/58/130/60/9i
#        gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
#      gmt nearneighbor interpAphi_gridnan  -I5k -S100k  -Gtemp.nc -R-179.99/-110/47/72
# gmt grdimage temp.nc  -CPaxes3.cpt -Q
#         gmt coast -R-175.99/44/-100/67r  -A500 -Di -Wthinnest -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#       gmt psxy AKPaxesgrid -SV0.15+jc  -Cblack.cpt  -Wthin+cl  -Baf 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes3.cpt -Ba1+l"A@~f@~" 
# gmt end show
# 
# gmt begin gridResults5_n15  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE plain
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JA-145/62/20/21c
# #    gmt coast -R-150/50/-153/66r  -G90  -Ba5g5 -Di -Sgray  -N1/faint  -JOc-160/58/130/60/9i
#        gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
#      gmt nearneighbor interpAphi_gridnan_n15  -I5k -S100k  -Gtemp.nc -R-179.99/-110/47/72
# gmt grdimage temp.nc  -CPaxes3.cpt -Q
#         gmt coast -R-175.99/44/-100/67r  -A500 -Di -Wthinnest -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#       gmt psxy AKPaxesgrid -SV0.15+jc  -Cblack.cpt  -Wthin+cl  -Baf 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes3.cpt -Ba1+l"A@~f@~" 
# gmt end show


gmt begin NEHRP_ZoneInversion  png
gmt gmtset MAP_FRAME_TYPE plain
      gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Sgray -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
 gmt grdimage @earth_relief_05m -I-0.85
       gmt coast -R-175.99/44/-100/67r  -Gdarkgray  -Da -Cgray -Ba5g5 -N1/thicker,dimgray -N2/faint,dimgray -JA-145/62/50/7.5i
gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
  gmt psxy AKPaxes4_lowmin  -SV0.5+jc   -Cblack.cpt  -Wthick+cl 
    gmt psxy AKPaxes4_highmax  -SV0.5+jc  -Cblack.cpt  -Wthick+cl 
    # gmt psxy AKPaxes4_lowmin  -SV0.5+jc   -CPaxes3.cpt  -Wthin+cl 
#     gmt psxy AKPaxes4_highmax  -SV0.5+jc  -CPaxes3.cpt  -Wthin+cl 
       gmt psxy AKPaxes4  -SV0.5+jc  -CPaxes3.cpt  -Wthick+cl 
        gmt gmtset FONT_ANNOT_PRIMARY 16p,Helvetica-Bold,white
     gmt gmtset FONT_ANNOT_SECONDARY 16p,Helvetica-Bold,white
     gmt gmtset FONT_LABEL 16p,Helvetica-Bold,white

    gmt psscale -Dx10.2c/1.2c+w3.5c/0.5c+jTC+h+ml -CPaxes3.cpt -Ba1
# gmt psscale -Dx15.2c/10.2c+w3.5c/0.5c+jTC+h+ml -CPaxes3.cpt -Ba1+l"A@~f@~" 
gmt end show 








# 
# gmt begin AK_Zoom  png
#  gmt gmtset MAP_FRAME_TYPE inside
#    gmt coast -R-154/-139/59/66 -Wfaint -Gdarkgray  -Da -Sgray -Ba2g1 -N1/faint -JM5.5i
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#  gmt psxy MannWindow.txt  -Wthick,purple
#  gmt psxy Mann25km.txt  -Wthick,purple
#    gmt psxy All_AKPaxes  -SV0.5+jc   -CPaxes5.cpt  -Wthinnest+cl 
# #    gmt psxy smoothAlaska_Paxes  -SV0.5+jc   -CPaxes5.cpt  -Wthinnest+cl 
# gmt end show 

# gmt begin AK_SlabMechs  png
#     gmt coast -R-169.99/-120.01/52.01/71.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JC7.5i
#  gmt psxy NSHM2023_Alaska_FaultSections.txt -R-169.99/-120.01/52.01/71.99 -Wthin
#    gmt psxy AllSlab_AKPaxes -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthinnest+cl 
# gmt end show
# 



# 
# gmt begin gridResults3  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE inside
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JA-145/62/20/21c
#    gmt coast -R-175/20/-120/85r  -Gdarkgray  -Bag -Di -Sgray  -N1/faint  -JOc-160/58/100/60/9i
#   
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#    gmt psxy rotPaxesgrid  -SV0.5+jc   -CPaxes5.cpt  -Wthin+cl 
#    gmt psxy rotPaxesgrid_ext  -SV0.5+jc   -CPaxes5.cpt  -Wthin+cl 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show

# gmt begin gridResults4  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE inside
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JA-145/62/20/21c
#    gmt coast -R-155/35/180/75r  -Gdarkgray  -Ba10g10 -Di -Sgray  -N1/faint  -JOc-160/58/130/60/9i
#   
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#       gmt psxy rotPaxesgrid_ext -SV0.15+ba+ea+g+jc  -CPaxes5.cpt  -Wthin+cl  -Baf -Gred
#    gmt psxy rotPaxesgrid  -SV0.15+ea+g+jc   -CPaxes5.cpt  -Wthin+cl -Gblue
#    gmt psxy rotPaxesgrid_ss  -SV0.15+jc -CPaxes5.cpt  -Wthin+cl 
# 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show

# gmt begin gridResults5  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE plain
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JA-145/62/20/21c
#    gmt coast -R-150/50/-153/66r  -G90  -Ba5g5 -Di -Sgray  -N1/faint  -JOc-160/58/130/60/9i
#   
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#       gmt psxy AKPaxesgrid -SV0.15+jc  -CPaxes5.cpt  -Wthin  -Baf 
#       gmt psxy rotPaxesgrid_ext -SV0.25+ba+ea+jc  -CPaxes5.cpt  -Wthin+cl  -Baf -Gred
#    gmt psxy rotPaxesgrid  -SV0.2+ea+jc+a60   -CPaxes5.cpt  -Wthick+cl -Gblue
#      gmt psxy rotPaxesgrid_ss  -SV0.15+jc -CPaxes5.cpt  -Wthin+cl 
# 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show

# gmt begin gridmisfit  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE plain
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JA-145/62/20/21c
#    gmt coast -R-150/35/-180/75r  -Gdarkgray  -Ba5g5 -Di -Sgray  -N1/faint  -JOc-160/58/130/60/9i
#   
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#         gmt psxy gridmisfits  -Sc -Wthin 
# 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show




# gmt begin gridResults5  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE inside
#    gmt coast -R-170/37/-140/80r  -Gdarkgray  -Bag -Di -Sgray  -N1/faint  -JOc-160/58/80/60/9i
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Bag -Di -Sgray  -N1/faint  -JM9i
#   
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#    gmt psxy rotPaxesgrid  -SV0.5+jc   -CPaxes5.cpt  -Wthin+cl 
# #    gmt psxy rotPaxesgrid_ext  -SV0.5+jc+e+b   -CPaxes5.cpt  -Wthin+cl 
#    gmt psxy rotPaxesgrid_ext -SV0.15+ba+ea+g  -CPaxes5.cpt  -Wthin+cl  -Baf 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show
# 
# gmt begin gridResults6  png
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
# gmt gmtset MAP_FRAME_TYPE inside
#    gmt coast -R-155/35/180/75r  -Gdarkgray  -Ba10g10 -Di -Sgray  -N1/faint  -JOc-160/58/130/60/9i
# #    gmt coast -R-180/-110/47/72  -Gdarkgray  -Bag -Di -Sgray  -N1/faint  -JM9i
#   
#  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#    gmt psxy rotPaxesgrid  -SV0.5+jc   -CPaxes5.cpt  -Wthin+cl 
# #    gmt psxy rotPaxesgrid_ext  -SV0.5+jc+e+b   -CPaxes5.cpt  -Wthin+cl 
#    gmt psxy rotPaxesgrid_ext -SV0.15+ba+ea+g  -CPaxes5.cpt  -Wthin+cl  -Baf 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show
# 
# gmt gmtset MAP_FRAME_TYPE inside
# gmt begin gridPolar  png
# gmt gmtset MAP_FRAME_TYPE fancy
#  gmt gmtset FONT_ANNOT_PRIMARY Helvetica,14
#   gmt gmtset MAP_FRAME_TYPE fancy
# gmt gmtset MAP_FRAME_TYPE inside
#    gmt coast -R-180/-110/47/72  -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JM7.5i
#   gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin
#    
#      gmt psxy MannWindow.txt  -Wthin,green
# 
# 
#     gmt psxy AKPaxes_12neighbors_weighted  -SV0.5+jc   -CPaxes5.cpt  -Wthicker+cl 
#     gmt psscale -Dx15.2c/15.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show


# gmt begin gridMisfit  png
#     gmt coast -R-169.99/-125.01/54.01/69.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JC7.5i
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,green
#     gmt psxy gridMisfit  -Sc -Wfaint
#         gmt psxy gridMisfit_45  -Sc -Wthick
#        gmt psxy AKPaxes4  -SV0.5+jc   -CPaxes3.cpt  -Wthickest+cl 
# gmt end show 



# gmt begin smoothPaxes  png
# 
#     gmt coast -R-179/-110/47/72 -Wfaint -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JC7.5i
# #     gmt psxy CrustalM4plus.xyM  -Sc -Wfaint,yellow
# gmt psxy MannWindow.txt  -Wthin,orange
# # gmt psxy BoxVertices  -Wthin
# gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,green
# #     gmt psxy HerrmannMT_LonLatZ.txt  -Sc0.5 -Wthicker,green
# #  gmt psxy WSM_Alaska.txt  -SV0.5+jc    -Wthinnest
#  gmt psxy smoothPaxesgrid.txt -SV0.5+jc   -CPaxes5.cpt  -Wthin+cl
#      gmt psxy Mann25km.txt  -Wthin,orange
# #        gmt psxy AKPaxes4  -Sc0.5     -Wthick,green
# #        gmt psxy AKPaxes4  -SV0.5+jc   -CPaxes3.cpt  -Wthickest+cl 
#  gmt psxy WSM_Alaska.txt  -SV0.5+jc    -Wthin
# 
# gmt end show 

# gmt begin SSA_SmoothMechs  png
#     gmt coast -R-169.99/-132.01/56.01/70.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba4 -N1/faint -JC7.5i
#  gmt psxy lumpvertices.txt -R-169.99/-132.01/56.01/70.99 -Wfaint,dimgray,..
#  gmt psxy NSHM2023_Alaska_FaultSections.txt -R-169.99/-132.01/56.01/70.99 -Wthin
#    gmt psxy smoothPaxesgrid.txt -R-169.99/-132.01/56.01/70.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthick+cl 
# gmt end show 
# 
# gmt begin SSA_Years  png
# gmt gmtset MAP_FRAME_TYPE plain
#     gmt coast -R-179.99/-110.01/51.01/71.99  -G40  -Da -S80 -Ba5g10 -N1/faint -JA-145/62/30/12c
# #  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,dimgray
# #   gmt psxy locs2008.txt  -Sc0.2    -Wthick
#           gmt psxy locsCMT.txt  -Sc0.08 -Wfaint,red -Gred
#   gmt psxy locs2023.txt  -Sc0.06 -Wfaint,forestgreen -Gforestgreen
#   gmt psxy locs2008.txt  -Sc0.04    -Wfaint,white -Gwhite
# 
# gmt end show 
# 
# gmt begin FMsource  png
# gmt gmtset MAP_FRAME_TYPE plain
#     gmt coast -R-172.99/-130.01/47.01/71.99  -G40  -Da -S80 -Ba5g5 -N1/faint -JM12c
# #  gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthin,dimgray
# #   gmt psxy locs2008.txt  -Sc0.2    -Wthick
#          #  gmt psxy locsCMT.txt  -Sc0.26 -Wfaint,red -Gred
# #   gmt psxy locs2023.txt  -Sc0.22 -Wfaint,forestgreen -Gforestgreen
# #   gmt psxy locs2008.txt  -Sc0.18    -Wfaint,white -Gwhite
# gmt psxy CMT_westAlaska.txt -Sa0.22 -Wthin,white
# gmt psxy CMT_eastAlaska.txt -Ss0.26 -Wthinner,yellow
# gmt psxy CMT_centralAlaska.txt -Sc0.18 -Wthin,magenta
# 
# gmt end show 

# 
# gmt begin SSA_CompareWRuppert  png
#     gmt coast -R-165.49/-134.01/57.01/70.99 -Wfaint -G240  -Da -Swhite -Ba2 -N1/faint -JC7.5i
#  gmt psxy NSHM2023_Alaska_FaultSections.txt -R-165.49/-134.01/57.01/70.99 -Wthin
#    gmt psxy lumpPaxesRuppertDims -R-165.49/-134.01/57.01/70.99 -SV0.5+jc -JC7.5i  -CPaxes4.cpt  -Wthick+cl 
#    gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CPaxes4.cpt -Ba1+l"A@~f@~" 
# gmt end show 
# 
# gmt begin SSA_UpdateRuppert  png
#     gmt coast -R-165.49/-134.01/57.01/70.99 -Wfaint -G240  -Da -Swhite -Ba2 -N1/faint -JC7.5i
#  gmt psxy NSHM2023_Alaska_FaultSections.txt -R-165.49/-134.01/57.01/70.99 -Wthin
#    gmt psxy lumpPaxes_sqrt2d12_weighted -R-165.49/-134.01/57.01/70.99 -SV0.5+jc -JC7.5i  -CPaxes4.cpt  -Wthick+cl 
#    gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CPaxes4.cpt -Ba1+l"A@~f@~" 
# gmt end show 
# 
# 
# gmt begin SSA_TintinaFaultFSP png
#     gmt coast -R-147.99/-140.01/64.5/66.00 -Wfaint -Gdarkgray  -Da -Sgray -Ba2g1 -N1/faint -JC7.5i
#     gmt psxy All_AKPaxes -R-147.99/-140.01/64.5/66.00 -SV0.5+jc -JC7.5i -I0.5 -CPaxes5.cpt  -Wfaint+cl 
# gmt psxy greenfile.txt -R-147.99/-140.01/64.5/66.00 -Wthick,forestgreen
#  gmt psxy yellowfile.txt -R-147.99/-140.01/64.5/66.00 -Wthicker,yellow
#  gmt psxy redfile.txt -R-147.99/-140.01/64.5/66.00 -Wthickest,red
# gmt end show 


# gmt begin SSA_KaltagFaultFSP png
#     gmt coast -R-165/-145/62/67 -Wfaint -Gdarkgray  -Da -Sgray -Ba2g1 -N1/faint -JC7.5i
# gmt psxy greenfile.txt -R-147.99/-139.01/64.01/66.99 -Wthick,forestgreen
#  gmt psxy yellowfile.txt -R-147.99/-139.01/64.01/66.99 -Wthicker,yellow
#  gmt psxy redfile.txt -R-147.99/-139.01/64.01/66.99 -Wthickest,red
#  gmt end show 


 
# gmt begin Cordova png 
#     gmt coast -R-148.99/-140.01/65.01/66.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba1g0.5 -N1/faint -JC7.5i
#   gmt psxy All_AKPaxes -R-148.99/-140.01/65.01/66.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthick+cl 
#    gmt psxy BoxVertices -R-148.99/-140.01/65.01/66.99 -Wthin
# 
# gmt end show 







# gmt begin FIGURE2b png
# gmt gmtset MAP_FRAME_TYPE fancy
#     gmt coast -R-149.99/-138.01/58.01/62.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba2g1 -N1/faint -JC7.5i
# # gmt psxy BoxVertices -R-169.99/-120.01/52.01/71.99 -Wfaint,green
#  gmt psxy NSHM2023_Alaska_FaultSections.txt -R-149.99/-138.01/58.01/62.99 -Wthin
#  gmt psxy unusedPaxes3 -R-149.99/-138.01/58.01/62.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthinnest+cl 
#  gmt psxy AKPaxes3 -R-149.99/-138.01/58.01/62.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthickest+cl 
#   #  gmt psxy lumpPaxesext -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi2.cpt  -Wthicker+cl 
# #    gmt psxy lumpPaxescomp -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi2.cpt  -Wthicker+cl 
# #    gmt psxy lumpPaxesext2 -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi2.cpt  -Wfaint+cl 
# #       gmt psxy lumpPaxescomp2 -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi2.cpt  -Wfaint+cl 
# 
# # gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show 

# gmt gmtset MAP_FRAME_TYPE fancy
# 
# gmt begin SSA_BWAphi png 
# gmt gmtset MAP_FRAME_TYPE fancy
#     gmt coast -R-169.99/-120.01/50.01/69.99 -Wfaint -Gdarkgray -Da -Sgray -Ba5 -N1/faint -JC7.5i
#      gmt psxy NSHM2023_Alaska_FaultSections.txt  -JC7.5i    -Wthin,red
#     gmt nearneighbor interpAphi_sqrt2d12  -I2k -S15k -R-169.99/-130.01/56.01/69.99 -Gtemp.nc
#      gmt psxy AKPaxes_comp_weighted  -SV0.5+jc -JC7.5i  -CBWAphi3.cpt  -Wthinner+cl 
# 
#    gmt psxy AKPaxes_ext_weighted  -SV0.5+jc -JC7.5i  -CBWAphi3.cpt  -Wthinner+cl 
#         gmt psxy AKPaxes_comp_weighted  -SV0.5+jc -JC7.5i  -CBWAphi3.cpt  -Wfaint+cl 
#         
#  gmt grdimage temp.nc -JC7.5i  -CBWAphi2.cpt  -Q
#      gmt coast  -Wfaint  -Da -Ba5 -N1/faint -JC7.5i
#        gmt psxy lumpPaxescomp_sqrt2d12  -SV0.5+jc -JC7.5i  -CBWAphi3.cpt  -Wfaint+cl 
# 
#    gmt psxy lumpPaxesext_sqrt2d12  -SV0.5+jc -JC7.5i  -CBWAphi3.cpt  -Wfaint+cl 
#   #  gmt psxy AKPaxes1gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthickest+cl 
# #    gmt psxy AKPaxes2gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthickest+cl 
# #    gmt psxy AKPaxes3gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthick+cl 
# #    gmt psxy AKPaxes4gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthick+cl 
# #    gmt psxy AKPaxes5gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthinner+cl 
# #    gmt psxy AKPaxes6gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthinner+cl 
#  gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CBWAphi2.cpt -Ba1+l"A@~f@~" 
# #     gmt psxy RuppertPolygons.txt -R-158.99/-120.01/52.01/64.99 -JC7.5i    -Wthinnest
# gmt end show # end will finish the plots and open them in a viewer
# 
# gmt begin SSA_BWAphi_alt png 
# gmt gmtset MAP_FRAME_TYPE inside
#     gmt coast -R-169.99/-130.01/56.01/69.99 -Gdarkgray -Da -Sgray -Ba5 -N1/faint -JM7.5i
# #      gmt psxy NSHM2023_Alaska_FaultSections.txt     -Wthin,red
# #     gmt nearneighbor interpAphi_grid_weighted  -I2k -S15k -R-179.99/-130.01/56.01/69.99 -Gtemp.nc
#  gmt grdimage temp.nc  -CBWAphi.cpt  -Q
#      gmt coast  -Wthinnest  -Da -Ba5 -N1/thinner
#  gmt psxy CrustalM4Plus.xyM  -Sc    -Wthin,yellow
# #  gmt psxy smoothAlaska_Paxes  -Sc0.05  -I-0.5 -CPaxes5.cpt  -Wthin,cyan
# #  gmt psxy smoothAlaska_Paxes  -SV0.5+jc  -I-0.5 -CPaxes5.cpt  -Wfaint+cl 
#     gmt psxy MannWindow.txt  -Wthickest,orange
#      gmt psxy NSHM2023_Alaska_FaultSections.txt  -Wthick,darkgreen
#         gmt psxy AKPaxes_comp_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthin+cl 
#    gmt psxy AKPaxes_ext_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthinner+cl 
#         gmt psxy AKPaxes_comp_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthinnest+cl 
#            gmt psxy AKPaxes_ext_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wfaint+cl 
#  gmt psxy MannWindow.txt  -Wthickest,orange
# #    gmt psxy All_AKPaxes  -SV0.5+jc   -CPaxes5.cpt  -Wthin+cl 
#  gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CBWAphi.cpt -Ba1+l"A@~f@~" 
# gmt end show # end will finish the plots and open them in a viewer

# gmt begin SSA_BWAphi_Statewide png 
# gmt gmtset MAP_FRAME_TYPE inside
#     gmt coast -R-180/-120/54/72 -Wfaint -Gdarkgray -Da -Sgray -Ba5 -N1/faint -JM13.5i
# #      gmt psxy NSHM2023_Alaska_FaultSections.txt     -Wthin,red
#   #   gmt nearneighbor interpAphi_grid_weighted  -I2k -S15k -R-153/-140/58/62 -Gtemp.nc
# #  gmt grdimage temp.nc  -CBWAphi.cpt  -Q
# #      gmt coast   -Wfaint  -Da -Ba5 -N1/faint 
# #        gmt psxy AK_comp_weighted_2  -SV0.5+jc  -CBWAphi3.cpt  -Wthicker+cl 
# #    gmt psxy AKPaxes_ext_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthick+cl 
# # gmt psxy AK_ext_weighted -SV0.9+jc -Gyellow -W0.5p
# # gmt psxy AK_ext_weighted_2 -SV0.15i+bc+ea+jc -Gyellow -W0.5p,red 
# gmt psxy AK_comp_weighted_2  -SV0.15i+jc  -Wthicker,blue
# gmt psxy AK_ext_weighted_2  -SV0.15i+ba+ea+jc+h1+a30  -Wthick,red
# # gmt psxy AK_ext_weighted_2  -SV0.15+jc+h0  -W0.15p
# # gmt psxy AK_ext_weighted_foo  -SV0.15i+bc+ea -Gyellow -W0.5p -Baf 
# #  gmt psscale -Dx15.2c/1.2c+w3.5c/0.5c+jTC+h+ml -CBWAphi.cpt -Ba1+l"A@~f@~" 
# gmt end show # end will finish the plots and open them in a viewer
# 
# gmt begin SSA_BWAphi_SCAK png 
# gmt gmtset MAP_FRAME_TYPE inside
#     gmt coast -R-155/-140/58/65 -Wfaint -Gdarkgray -Da -Sgray -Ba5 -N1/faint -JM12i
# #      gmt psxy NSHM2023_Alaska_FaultSections.txt     -Wthin,red
#   #   gmt nearneighbor interpAphi_grid_weighted  -I2k -S15k -R-153/-140/58/62 -Gtemp.nc
# #  gmt grdimage temp.nc  -CBWAphi.cpt  -Q
# #      gmt coast   -Wfaint  -Da -Ba5 -N1/faint 
# #        gmt psxy AK_comp_weighted_2  -SV0.5+jc  -CBWAphi3.cpt  -Wthicker+cl 
# #    gmt psxy AKPaxes_ext_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthick+cl 
# # gmt psxy AK_ext_weighted -SV0.9+jc -Gyellow -W0.5p
# # gmt psxy AK_ext_weighted_2 -SV0.15i+bc+ea+jc -Gyellow -W0.5p,red 
# gmt psxy AK_comp_weighted_2  -SV0.15i+jc  -Wthicker,blue
# gmt psxy AK_ext_weighted_2  -SV0.15i+ba+ea+jc+h0+a30  -Wthick,red
# # gmt psxy AK_ext_weighted_2  -SV0.15+jc+h0  -W0.15p
# gmt psxy AK_ext_weighted_2  -SV0.15i+bc+ea -Gyellow -W0.5p -Baf 
# #  gmt psscale -Dx15.2c/1.2c+w3.5c/0.5c+jTC+h+ml -CBWAphi.cpt -Ba1+l"A@~f@~" 
# gmt end show # end will finish the plots and open them in a viewer

# gmt begin SSA_BWAphi_CCAK png 
# gmt gmtset MAP_FRAME_TYPE inside
#     gmt coast -R-153/-140/62/66 -Wfaint -Gdarkgray -Da -Sgray -Ba5 -N1/faint -JM7.5i
# #      gmt psxy NSHM2023_Alaska_FaultSections.txt     -Wthin,red
#     gmt nearneighbor interpAphi_grid_weighted  -I2k -S15k -R-153/-140/62/66 -Gtemp.nc
#  gmt grdimage temp.nc  -CBWAphi.cpt  -Q
#      gmt coast   -Wfaint  -Da -Ba5 -N1/faint 
#        gmt psxy AKPaxes_comp_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthin+cl 
#    gmt psxy AKPaxes_ext_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthinner+cl 
#         gmt psxy AKPaxes_comp_weighted   -SV0.5+jc  -CBWAphi3.cpt  -Wthinnest+cl 
#  gmt psscale -Dx15.2c/1.2c+w3.5c/0.5c+jTC+h+ml -CBWAphi.cpt -Ba1+l"A@~f@~" 
# gmt end show # end will finish the plots and open them in a viewer


# gmt begin FIGURE23 png 
# gmt gmtset MAP_FRAME_TYPE fancy
#     gmt coast -R-169.99/-120.01/52.01/71.99 -Wfaint -Gdarkgreen -Da -Sblue -Ba5 -N1/faint -JC7.5i
#      gmt psxy NSHM2023_Alaska_FaultSections.txt -R-169.99/-120.01/52.01/71.99 -JC7.5i    -Wthin,red
# #      gmt psxy AKPaxesgridw05_n12 -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi.cpt  -Wthickest+cl 
# #      gmt psxy lumpPaxes -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi.cpt  -Wthickest+cl 
#  gmt psxy AKPaxes_ext -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi.cpt  -Wthick+cl 
#     gmt psxy AKPaxes_comp -R-169.99/-120.01/52.01/71.99 -SV0.5+jc -JC7.5i  -CBWAphi.cpt  -Wthin+cl 
#     # gmt nearneighbor AKPaxesgridw05_n12 -I5k -S30k -R-169.99/-120.01/52.01/71.99 -Gtemp.nc
# #  gmt grdimage temp.nc -JC7.5i  -CBWAphi.cpt  -Q
#   #  gmt psxy AKPaxes1gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthickest+cl 
# #    gmt psxy AKPaxes2gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthickest+cl 
# #    gmt psxy AKPaxes3gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthick+cl 
# #    gmt psxy AKPaxes4gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthick+cl 
# #    gmt psxy AKPaxes5gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthinner+cl 
# #    gmt psxy AKPaxes6gridw05_n12 -R-158.99/-120.01/52.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthinner+cl 
#  gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CBWAphi.cpt -Ba1+l"A@~f@~" 
# #     gmt psxy RuppertPolygons.txt -R-158.99/-120.01/52.01/64.99 -JC7.5i    -Wthinnest
# gmt end show
# 
# gmt begin FIGURE22 png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
#     gmt coast -R-158.99/-120.01/52.01/67.99  -Wfaint -Gdarkgray  -Da -Sgray -Ba2g2 -N1/faint -JC7.5i
#    gmt psxy AKPaxesgridw05_n12 -R-158.99/-120.01/52.01/67.99  -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthick+cl 
#  gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show # end will finish the plots and open them in a viewer
# gmt begin FIGURE23 png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
#     gmt coast -R-158.99/-120.01/52.01/67.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba2g0.5 -N1/faint -JC7.5i
#    gmt psxy AKPaxesgridw05_n12 -R-158.99/-120.01/52.01/67.99  -SV0.5+jc -JC7.5i  -CPaxes5.cpt  -Wthicker+cl 
#  gmt psscale -Dx15.2c/13.2c+w3.5c/0.5c+jTC+h+ml -CPaxes5.cpt -Ba1+l"A@~f@~" 
# gmt end show # end will finish the plots and open them in a viewer
# 
# 
# 
# gmt begin FIGURE3 png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
#     # Lay down painted continent with national borders on a Mercator map
#     gmt coast -R-144.99/-136.01/59.01/64.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JC7.5i
#     gmt coast -R-144.99/-136.01/59.01/64.99 -Wfaint -Gdarkgray   -Sgray -Ba1g0.5 -N2/faint -N1/thin -JC7.5i
# #     gmt nearneighbor 2_2014_5hz2pct50yrs.dat -I5k -S10k -R-92.99/-70.01/32.01/48.99 -Gtemp.nc
# # 	gmt grdimage temp.nc -JM5.5i -CIsoRes.cpt -Q >> FIGURE.eps
#    gmt psxy All_AKPaxes -R-144.99/-136.01/59.01/64.99 -SV0.5+jc -JC7.5i  -CPaxes4.cpt  -Wthicker+cl 
#    gmt pstext AKFaults.txt -R-144.99/-136.01/59.01/64.99 -JC7.5i -F+fblack   
# gmt psxy Toklat.txt -R-144.99/-136.01/59.01/64.99 -Wthick
# 
#     # Show where Italy is in the world via a map inset
#     # gmt inset begin -DjTR+w4c+o0.2c -M0 -F+gwhite+pthick
# #         gmt coast -Rg -JG90W/37N/4c -Gdarkgray -Bg -EUS+gred
# #    gmt inset end
# gmt end show # end will finish the plots and open them in a viewer
# 
# 
# gmt begin FIGURE4 png # Starting our new gmt modern mode session, calling plot italy and ask for pdf and png
#     # Lay down painted continent with national borders on a Mercator map
#     gmt coast -R-155.99/-142.01/52.01/62.99 -Wfaint -Gdarkgray  -Da -Sgray -Ba2 -N1/faint -JM7.5i
#     gmt coast -R-155.99/-142.01/52.01/62.99 -Wfaint -Gdarkgray   -Sgray -Ba2g1 -N2/faint -N1/thin -JM7.5i
# #     gmt nearneighbor 2_2014_5hz2pct50yrs.dat -I5k -S10k -R-92.99/-70.01/32.01/48.99 -Gtemp.nc
# # 	gmt grdimage temp.nc -JM5.5i -CIsoRes.cpt -Q >> FIGURE.eps
#    gmt psxy All_AKPaxes -R-155.99/-142.01/52.01/62.99 -SV0.5+jc -JM7.5i  -CPaxes4.cpt  -Wthinner+cl 
# #    gmt pstext AKFaults.txt -R-158.99/-140.01/60.01/67.99 -JC7.5i -F+fblack   
# gmt psxy Toklat.txt -R-155.99/-142.01/52.01/62.99 -Wthick
# 
#     # Show where Italy is in the world via a map inset
#     # gmt inset begin -DjTR+w4c+o0.2c -M0 -F+gwhite+pthick
# #         gmt coast -Rg -JG90W/37N/4c -Gdarkgray -Bg -EUS+gred
# #    gmt inset end
# gmt end show # end will finish the plots and open them in a viewer

# gmt gmtset COLOR_MODEL rgb
# gmt gmtset FONT_TITLE 14,Helvetica-Bold,black
# gmt gmtset FONT_ANNOT_PRIMARY 8,Helvetica,black
# gmt gmtset FONT_ANNOT_SECONDARY 8,black
# gmt gmtset MAP_FRAME_TYPE inside
# gmt gmtset MAP_TICK_LENGTH_PRIMARY 0
# gmt gmtset MAP_TICK_LENGTH_SECONDARY 0
# gmt gmtset MAP_GRID_PEN_PRIMARY 0.1p
# gmt gmtset MAP_FRAME_PEN thick,black
# 
# 
# 
# 
# #gmt makecpt -Cgrays -T-0.5/1/0.1  -D> Hazard.cpt
# gmt makecpt -Cseis -T-65/65/10 -I -D> IsoRes.cpt
# gmt pscoast -Di  -R-92.99/-70.01/32.01/48.99 -JM5.5i -X0.2i -Y3i -Ba1000:."":WNes -N1/0.1p,dimgray,-  -Cdarkgray -Sgray -Gdarkgray -P -K > FIGURE.eps
# gmt pscoast -Di  -R -JM5.5i -Ba1000:."":WNes -N2/0.1p,dimgray     -K -O>> FIGURE.eps
# gmt pscoast -Di  -R -JM5.5i -Ba1000:."":WNes -N1/0.1p,dimgray,-     -K -O>> FIGURE.eps
#  gmt nearneighbor 2_2014_5hz2pct50yrs.dat -I5k -S10k -R -Gtemp.nc
# #  gmt grdimage temp.nc -JM5.5i -P -CHazard.cpt -O -K -Q >> FIGURE.eps
# gmt pscoast -Di  -R -JM5.5i -Ba1000:."":WNes -N1/1p,dimgray     -K -O>> FIGURE.eps
# gmt pscoast -Di  -R -JM5.5i -Ba1000:."":WNes -N2/0.1p,dimgray,-     -K -O>> FIGURE.eps
#   gmt psxy ../USAStress/WSM2016_AtoDnoFMs_vecs -R -SV0.5+jc -JM5.5i -O -K -CPaxes.cpt  -Wfaint >>FIGURE.eps    
# gmt pscoast -Di  -R -JM5.5i -Ba1000:."":WNes -N2/0.1p,dimgray,-    -K -O>> FIGURE.eps
#  gmt psxy SmoothCEUS_Paxes2022 -R -SV0.5+jc -JM5.5i  -O -K -CPaxes2.cpt  -Wthinner+cl >>FIGURE.eps
#   gmt psxy ETSZ_Paxes2022 -R -SV0.5+jc -JM5.5i  -O -K -CPaxes.cpt  -Wthin+cl >>FIGURE.eps
# gmt psxy NYAL_Brandmayr -R -JM5.5i -O -K -Wthinnest,black,-- >> FIGURE.eps
# open FIGURE.eps 