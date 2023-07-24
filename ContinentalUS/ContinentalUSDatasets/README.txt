README

ConUS...txt contains the most up-to-date collection of 6525 focal mechanisms for (mostly) the continental U.S.
The structure is noted in the top line, commented out for use in MATLAB.
There are some non-ConUS mechanisms (e.g., from Alaska) that I haven't gotten around to weeding out yet.

The Excel spreadsheet contains more complete metadata (e.g., date/time, depth, reference).
I have not had a chance to add all of the mechanisms contained in ConUS...txt.

FM_Paxes.txt is formatted for plotting with GMT. [Longitude Latitude Pseudo-Aphi SHmax Length]
   Pseudo-Aphi defines faulting style following the convention of Zoback (1992):
       Normal (NF) = 0.5; Oblique-Normal (NS) = 1.0; Strike-slip (SS) = 1.5; Reverse-Oblique (TS) = 2.0; Thrust (TF) = 2.5 
   SHmax is defined following the convention of Zoback (1992):
    P/S1-axis          B/S2-axis      T/S3-axis    Regime   SHmax      
      plunge > 52                    plunge < 35   NF      B-axis trend     
     40<plunge<52                    plunge < 20   NS      T-axis trend + 90  
      plunge < 40     plunge > 45    plunge < 20   SS      T-axis trend + 90  
      plunge < 20     plunge > 45    plunge < 40   SS      P-axis trend   
      plunge < 20                   40<plunge<52   TS      P-axis trend         
      plunge < 35                    plunge > 52   TF      P-axis trend     

smooth_Paxes.txt is formatted for plotting with GMT. [Longitude Latitude Pseudo-Aphi SHmax Length]
     Smoothing: For each focal mechanism; 
                Select focal mechanisms within 10 km; 
                Weight selected focal mechanisms with 1-km Gaussian*
                Smooth pseudo-aphi and smooth SHmax are weighted averages of selected mechanisms
     * Weights = exp(-distance.^2/(2*GaussRadius)^2); 
       Weights=Weights/sum(Weights); 
       smoothSHmax=dot(Weights,SH);
       smoothPseudoAphi=dot(Weights,PseudoAphi); 

smoother_Paxes.txt is formatted for plotting with GMT. [Longitude Latitude Pseudo-Aphi SHmax Length]
     Smoothing: For each focal mechanism; 
                Select focal mechanisms within 100 km; 
                Weight selected focal mechanisms with 5-km Gaussian*
                Smooth pseudo-aphi and smooth SHmax are weighted averages of selected mechanisms



InSituIndicators.txt 
This file simply reformats the stress indicators (e.g., borehole breakouts) compiled by Lund-Snee and Zoback (2020).
Focal mechanism data from that compilation are not included in this file but rather are included in the datasets described above.
Note also that Lund-Snee and Zoback (2020) recapitulate all pertinent World Stress Map data and add many new data.

Pertinent citations:
Levandowski, W., Herrmann, R. B., Briggs, R., Boyd, O., & Gold, R. (2018). An updated stress map of the continental United States reveals heterogeneous intraplate stress. Nature Geoscience, 11(6), 433-437.
Lund-Snee, J. E., & Zoback, M. D. (2020). Multiscale variations of the crustal stress field throughout North America. Nature communications, 11(1), 1951.
 
