if subregion == 1
     Poly=AlaskaPoly;name='All Alaska';plot_file='Alaska';
 end

  if subregion == 2
     Poly=[-170 64
         -170 66.5 
         -160 66.5
         -160 64
         -170 64];
     name='Seward Peninsula';plot_file='SewardPeninsula'; %% 
  end
    if subregion == 3
     Poly=[
         -160 66.5
         -160 64
         -156.5 64
         -156.5 66.5
         -160 66.5];
     name='Shungnak';plot_file='Shungnak'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
    end
   if subregion == 4
     Poly=[
         
         -156 66.5
         -156 66.25
         -150.5 66.25
         -150.5 67
         -148 67
         -148 70
         -170 70
         -170 66.5
         -156 66.5
         ];
     name='Baird Mountains';plot_file='BairdMtns'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
   end
   if subregion == 5
     Poly=[
         
        
         -148 68
         -148 69.4
         -143 69.4
         -143 68
         -148 68
         ];
     name='Phillip Smith Mountains';plot_file='SmithMtns'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
   end
  
    if subregion == 6
     Poly=[
         
        
         -148 69.601
         -144.4 69.601
         -144.4 70
         -148 70
         -148 69.01
         ];
     name='Sadlebrochit Mountains';plot_file='SadlebrochitMtns'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
    end
  
     if subregion ==7
     Poly=[
         
        
         -148 69.4
         -144.49 69.4
         -144.49 69.601
         -148 69.601
         -148 69.4];
         
     name='Shublik Mountains';plot_file='ShublikMtns'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
  end
  if subregion ==8
     Poly=[
         
        
         -144.49 69.4
         -144.49 69.52
         -144 69.52
         -144 69.4
         -144.49 69.4];
         
     name='Upper Hulahula';plot_file='UpperHulahula'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
  end
 if subregion ==9
     Poly=[
         
        
        
         -144 69.52
         -144.4 69.52
         -144.4 70
         -144 70
         -144 69.52
];
         
     name='Lower Hulahula';plot_file='LowerHulahula'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
 end
  
 if subregion ==10
     Poly=[
         
        
        
         -148 68
         -148 67
         -147 67
         -147 66.5
         -146 66.5
         -146 66.75
         -140 66.75
         -140 68
         -148 68
         ];
         
         
     name='Porcupine';plot_file='Porcupine'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
 end
  
 if subregion ==11
     Poly=[
         
        
        -146 66
         -146 66.75
         -140 66.75
         -140 66
         -146 66];
         
         
     name='Salmon';plot_file='Salmon'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
 end
  
 if subregion ==12
     Poly=[
         
        
        
         -150.5 67
         -150.5 66.25
         -152.5 66.25
         -152.5 65.75
         -150 65.75
         -150 66
         -146 66.0
         -146 66.5
         -147 66.5
         -147 67
         -150.5 67];
         
         
     name='Yukon Flats';plot_file='YukonFlats'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
 end
 
  if subregion ==13
     Poly=[
         
        -147.6 66
        -147.6 65
        -140 65
         -140 66
         -147.6 66
        ];
         
         
     name='Tintina';plot_file='Tintina'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
  end
 
  if subregion ==14
     Poly=[
         
        -147.6 66
        -147.6 65.3
        -149.5 65.3
        -149.5 65
        -150.5 65
        -150.5 65.75
        -150 65.75
        -150 66
        -147.6 66
        ];
         
         
     name='Livengood-Rampart';plot_file='LivengoodRampart'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
  end
 
  if subregion ==15
     Poly=[
         
        -148.7 65.3
        -148.7 65
        -147.6 65
        -147.6 65.3
        -148.7 65.3
        
        ];
         
         
     name='Minto East';plot_file='MintoEast'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
  end
 
   if subregion ==16
     Poly=[
         
        -148.7 65.3
        -148.7 65
        -149.5 65
        -149.5 65.3
        -148.7 65.3
        
        ];
         
         
     name='Minto West';plot_file='MintoWest'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
   end
  
  if subregion ==17
     Poly=[
         
        -148.5 65
        -149.5 65
        -149.5 64.8
        -148.5 64.8
        -148.5 65
        
        ];
         
         
     name='Minto South';plot_file='MintoSouth'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
  end
  
 
  
 if subregion ==18
     Poly=[
         -149.4 64.8
        -148.8 64.8
        -149.6 64.3
        -150    64.3
        -149.4 64.8];
     name='Nenana North';plot_file='NenanaNorth'; %% 
 end
  if subregion ==19
     Poly=[
        -149.6 64.3
        -150.2    64.3
        -151 63.64
        -149.8 63.64 
        -149.6 64.3];
     name='Nenana South';plot_file='NenanaSouth'; %% 
  end
  
   if subregion ==20
     Poly=[
         
         -152.5 65
         -150.5 65
         -149.5 65
         -149.5 64.8
         -149.4 64.8
         -149.75 64.5
         -152.45 64.5
         -152.5 65
         
        ];
     name='Toklat';plot_file='Toklat'; %% 
  end
 
   if subregion ==21
     Poly=[
           -149.75 64.5
         -152.45 64.5
         -152.5 65
         -150.5 65
         -150.5 65.75
         -152.5 65.75
         -152.5 66.25
        -156.5    66.25
        -156.5    64
        -154 64
        -154.2 63.55
        -152.5 63.55
        -152.4 64.5
        ];
     name='Kaltag East';plot_file='KaltagEast'; %% 
   end
 
     if subregion ==22
     Poly=[
           -149.75 64.5
         -152.4 64.5
         -152.5 63.55
         -154.3 63.55
         -155 62.5
         -153 62.5 
         -151.8 63
         -151.6 63.64
         -151 63.64 
         -150.2    64.3
         -150    64.3
          -149.75 64.5
        ];
     name='Minchumina';plot_file='Minchumina'; %% 
     end
  
    if subregion ==23
     Poly=[
           -150.66 63.64
           -151.66 63.64
           -151 63.5 
           -150.6 63.5
           -150.6 63.64
        ];
     name='KantishnaNorth';plot_file='KantishnaNorth'; %% 
 end
    if subregion ==24
     Poly=[
           
           -151.6 63.64
           -151 63.5 
           -150.66 63.5
           -150.66 63.4
           -151.2 63.4
           -151.62 63.5
           -151.6 63.64
        ];
     name='KantishnaCentral';plot_file='KantishnaCentral'; %% 
    end
  if subregion ==25
     Poly=[
           
           
           -150.6 63.4
           -151.2 63.4
           -151.63 63.5
           -151.7 63.4
           -151 63.2 
           -150.8 63.2
           -150.8 63.4
        ];
     name='Kantishna3';plot_file='Kantishna3'; %% 
  end
 if subregion ==26
     Poly=[
           
           
           -151.68 63.4
           -151.72 63.25
           -151.1 63
           -150.8 63
           -150.8 63.2
           -151 63.2
           -151.68 63.4
        ];
     name='Kantishna4';plot_file='Kantishna4'; %% 
 end
  if subregion ==27
     Poly=[
           -151.72 63.25
           -151.8 63
           -151 63
          -151.72 63.25
        ];
     name='Kantishna5';plot_file='Kantishna5'; %% 
  end
  
  if subregion ==28
     Poly=[
           -146 62
           -146 62.4
           -145 62.4
           -145 62
           -146 62
          
        ];
     name='Glennallen';plot_file='Glennallen'; %% 
  end
  if subregion ==29
     Poly=[
           -140 70
           -140 65
           -142 65
           -142 64
           -132 64
           -132 70
           -140 70
          
          
        ];
     name='Richardson Mtns';plot_file='Richardson'; %% 
  end
   if subregion ==30
     Poly=[
         -135.5 55.9
         -135.5 60
         -137 61.5
         -140 62.5
           -140 64
           -132 64
           -132 70
           -110 70
           -110 51
           -130 51
           -130 55.9
           -135.5 55.9
          
          
        ];
     name='Mackenzie Mtns';plot_file='Mackenzie'; %% 
  end
    if subregion ==31
     Poly=[
         -146.5 63.4
         -145.8 63.4
         -145.8 63.7
         -146.5 63.7
         -146.5 63.4
          
          
        ];
     name='Delta River';plot_file='DeltaRiver'; %% 
    end
  
     if subregion ==32
     Poly=[
         -148.5 65
         -148.5 64.8
         -148.75 64.8
         -149.1 64.6
         -146 64.6
         -146 65
         -148.5 65
         
        ];
     name='Fairbanks';plot_file='Fairbanks'; %% 
  end
  if subregion ==33
     Poly=[
       
         -149.1 64.6
         -146 64.6
         -146 64.3
         -149.6 64.3
         -149.1 64.6
       
         
        ];
     name='Salcha';plot_file='Salcha'; %% 
  end
  
  if subregion ==34
     Poly=[
       
        
         -149.6 64.3
         -149.7 64.1
         -147.75 64.1
       -147.75  63.7 
       -145.5 63.7
       -145.5 64.3
       -149.6 64.3
         
        ];
     name='Blair Lakes';plot_file='BlairLakes'; %% 
  end
  
    if subregion ==35
     Poly=[
         -145.8 63.7
         -144.5 63.7
         -145 63
         -145.8 63
         -145.8 63.7
        
        ];
     name='Denali-McCallum';plot_file='DenaliMcCallum'; %% 
    end
    
     if subregion ==36
     Poly=[
         
         -145 63
         -144.5 63
         -144.15 63.2
         -144.8 63.3
         -145 63
       
        
        ];
     name='Mankomen Lake';plot_file='Mankomen'; %% 
     end
    
     if subregion ==37
     Poly=[
         
        
         -144.5 63
         -144.15 63.2
         -143.75 63
         -144 62.9
         -144.5 63
       
        
        ];
     name='Easternmost Denali';plot_file='EmostDenali'; %% 
     end
    
     if subregion ==38
     Poly=[
         
        
         
         -143.75 63
         -144 62.9
         -144 62.7
         -143.7 62.7
         -143.5 63
         -143.75 63
        
        ];
     name='West Totschunda';plot_file='WTotschunda'; %% 
     end
    
     if subregion ==39
     Poly=[
         -143.5 63
        -143 62.8
         -143 62.4
         -143.7 62.7
         -143.5 63
        
        ];
     name='Central Totschunda';plot_file='CTotschunda'; %% 
     end
    
      if subregion ==40
     Poly=[
        -143 62.8
         -143 61.5
         -142 61.5
         -142 62.8
         -143 62.8
        
        
        ];
     name='Eastern Totschunda';plot_file='ETotschunda'; %% 
    end
   if subregion ==41
     Poly=[
        -143.8 63.03
        -143.75 63
        -143.5 63
        -143 62.8
        -143 63.4
        -143.8 63.4
        -143.8 63.03
      
        
        ];
     name='North of Totschunda';plot_file='NTotschunda'; %% 
    end
   if subregion ==42
     Poly=[
        -142 61.65
        -142 63
        -140 63
        -140 61.65
        -142 61.65
      
        ];
     name='Chisana';plot_file='Chisana'; %% 
   end
    
   if subregion ==43
     Poly=[
        
     
        -140 61.65
        -142 61.65
       -142 61.4
        -140 61.4
        -140 61.65
      
        ];
     name='West St. Elias';plot_file='WStElias'; %% 
   end
    
     if subregion ==44
     Poly=[
        -149.8 63.64
        -150.6 63.64
        -150.65 63.45
        -149 63.45
       -147.75 63.7
       -147.75 64.1
       -149.66 64.1
       -149.8 63.64
       
        ];
     name='Nenana Basin';plot_file='NenanaBasin'; %% 
     end
    
        if subregion ==45
     Poly=[
         -147.75 63.7
         -148.1 63.4
       -149 63.4
        -149 63.45
        -147.75 63.7

       
       
        ];
     name='CDFWest';plot_file='CDFWest'; %% 
        end
    
         if subregion ==46
     Poly=[
         -147.75 63.7
         -148.1 63.4
         -147.8 63.4
         -147.45 63.7
         -147.75 63.7

        ];
     name='CDFCentral';plot_file='CDFCentral'; %% 
         end
    
            if subregion ==47
     Poly=[
         -147.45 63.7
         -147.8 63.4
         -147.5 63.4
         -147.15 63.7
         -147.45 63.7

        ];
     name='CDFCentral2';plot_file='CDFCentral2'; %% 
            end
    
    if subregion ==48
     Poly=[
         -147.15 63.7
         -147.5 63.4
         -147.2 63.4
         -146.85 63.7
         -147.15 63.7

        ];
     name='CDFCentral3';plot_file='CDFCentral3'; %% 
    end
    
     if subregion ==49
     Poly=[
         -146.85 63.7
         -147.2 63.4
         -146.5 63.4
         -146.5 63.7
         -146.85 63.7

        ];
     name='CDFCentral4';plot_file='CDFCentral4'; %% 
     end
    
      if subregion ==50
     Poly=[
         -148.39 62.43
         -146.5 62.43
         -146.5 63.4
         -148.2 63.4
         -148.39 62.43
        ];
     name='Broad Pass';plot_file='BroadPass'; %% 
      end
  
      if subregion ==51
     Poly=[
         -148.2 63.4
         -148.2 62.935
         -150.8 62.935
         -150.8 63.4
         -150.6 63.4
         -150.6 63.45
         -149 63.45
         -149 63.4 
         -148.2 63.4
         
         
        ];
     name='Cantwell';plot_file='Cantwell'; %% 
      end
  
      if subregion ==52
     Poly=[
         -148.2 62.935
         -150.8 62.935
         -150.8 62.55
         -148.2 62.55
         -148.2 62.935
        ];
     name='N Talkeetna Mtns';plot_file='NTalkeetnaMtns'; %% 
      end
  
    
      if subregion ==53
     Poly=[
         -150.8 63
         -150.8 62
         -151 62
         -151 61.8
         -153.25 61.8
         -153.25 62.4
         -151.8 63
          -150.8 63
        ];
     name='Chelatna';plot_file='Chelatna'; %% 
      end
      
      
      if subregion ==54
     Poly=[
         -150.8 62.55
         -150.8 62
         -149.5 62
         -149.5 62.55
         -150.8 62.55
        
        ];
     name='Talkeetna';plot_file='Talkeetna'; %% 
      end
    
          
      if subregion ==55
     Poly=[
         
         -151 62
         -149.75 62
         -149.75 61.5
         -151 61.5
         -151 62
       
        
        ];
     name='Willow-Skweetna';plot_file='Willow-Skweetna'; %% 
      end
  
    if subregion ==56
     Poly=[
        
         -149.5 62
         -149.5 62.55
         -148.39 62.55
         -148.39 62
         -149.5 62
        
        ];
     name='W Talkeetna Mtns';plot_file='WTalkeetnaMtns'; %% 
    end
      
    
    if subregion ==57
     Poly=[
        
         -147.25 62
         -147.25 62.45
         -148.39 62.45
         -148.39 62
         -147.25 62
        
        ];
     name='E Talkeetna Mtns';plot_file='ETalkeetnaMtns'; %% 
    end
    if subregion ==58
     Poly=[ 
         -148.25 62
         -148.39 62
         -148.39 62.06
         -146.5 62.06
         -146.5 61.7
         -146.9 61.7
         -147.75 61.4
            -148.1 61.4
            -148.1 61.5
         -148 61.5
         -148.25 62
        ];
     name='ECMF';plot_file='ECMF'; %% 
    end
    if subregion ==59
     Poly=[ 
     -150.35 61.9
         -149.75 61.66
         -148 61.66
         -148.25 62
         -149.75 62
         -150.35 61.91
         -150.35 61.9
        ];
     name='Matanuska';plot_file='Matanuska'; %% 
    end
   
     if subregion ==60
     Poly=[ 
     -151 61.5
     -151.4 60.8
     -150 60.8
         -150 61.5
         -151 61.5
        
        ];
     name='Upper Cook Inlet';plot_file='UpperCookInlet'; %% 
     end
   
    
     if subregion ==61
     Poly=[ 
         
    
     -146.9 61.7
     -147.66 61.43
     -146.8 61.43
     -146.8 61.43
     -145.5 61.43
     -145.5 61.7
     -146.9 61.7
        ];
     name='Lake Louise Plateau';plot_file='LakeLouisePlateau'; %% 
     end
    
         if subregion ==62
     Poly=[ 
    -147.66 61.43
    -147.75 61.4
    -147.75 61.18
    -146.85 61.18
    -146.85 61.43
    -147.66 61.43
   
   
        ];
     
     name='West Chugach';plot_file='West Chugach'; %% 
         end
     if subregion ==63
     Poly=[ 
   
    -146.85 61.43
    -146.85 61.18
    -145.5 61.18
    -145.5 61.43
    -146.85 61.43
        ];
     name='East Chugach';plot_file='EastChugach Crest'; %% 
     end
    
       if subregion ==64
     Poly=[ 
   
    -142 61.4
    -137 61.4
    -137 60.655
    -142 60.655
    -142 61.4
        ];
     name='East St. Elias';plot_file='EastStElias'; %% 
       end
       
         if subregion ==65
     Poly=[ 
   
    -147.75 61.18
    -145.5 61.18
    -145.5 60.8
    -147.75 60.8
    -147.75 61.18
    
        ];
     name='Kenai';plot_file='Kenai'; %% 
         end
       
    if subregion ==66
     Poly=[ 
   
    -147.75 60.8
    -145.5 60.8
    -145.5 60.4
    -147.75 60.4
    -147.75 60.8
    
        ];
     name='Prince Wm Sound';plot_file='PrinceWilliamSound'; %% 
    end
    
           
    if subregion ==67
     Poly=[ 
   
    -147.8 59.5
    -145.5 59.5
    -145.5 60.4
    -147.8 60.4
    -147.8 59.5
    
        ];
     name='Hinchinbrook';plot_file='Hinchinbrook'; %% 
    end
            
    if subregion ==68
     Poly=[ 
   
      -153.25 61.8
        -153.25 60.6
        -151.4 60.8
        -151 61.5
        -151 61.8
        -153.25 61.8
        ];
     name='Tordrillo';plot_file='Tordrillo'; %% 
    end
if subregion ==69
     Poly=[ 
      -170 64
        -154 64
        -155 62.5
        -153 62.5
        -153.25 62.4
        -153.25 60.25
        -158 58
        -166 59
        -170 59
        -170 64
        ];
     name='SW Alaska';plot_file='SW Alaska'; %% 
end
    
if subregion ==70
     Poly=[ 
   
      -159.2 57
      -159.2 56
      -152 56
      -152 57.3
      -157.3 58.3
      -159.2 57];
      
     name='Kodiak';plot_file='Kodiak'; %% 
end
    
if subregion ==71
     Poly=[ 
   
      -152 57.3
      -157.3 58.3
      -155.66 59.1
      -152 58
      -152 57.3];
      
     name='Katmai';plot_file='Katmai'; %% 
end
    
if subregion ==72
     Poly=[ 
   
     
      -155.66 59.1
      -153 58.4
      -153 59
      -150 59
      -150 59.7
      -154.3 59.7
      -155.66 59.1
      ];
      
     name='Central Cook Inlet';plot_file='CentralCook'; %% 
end
    if subregion ==73
     Poly=[ 
        -152 59.7
      -154.3 59.7
      -153.25 60.25
      -153.25 60.6
      -152.4 60.8
      -150 60.8
      -150 59.7
      -152 59.7
    ];
      
     name='Bruin Bay';plot_file='BruinBay'; %% 
    end

    if subregion ==74
     Poly=[ 
    
      -147.75 61.4
            -148.1 61.4
            -148.1 61.5
         -148 61.5
         -150 61.5
         -150 59
         -147.75 59
         -147.75 61.4
         
         ];
     name='West Chugach';plot_file='WestChugach'; %% 
    end
    if subregion==75
        Poly=[
            -145.5 61.5
            -145.5 59.5
            -143.85 59.5
            -143.85 61.5
            -145.5 61.5
          
            ];
                 name='Cordova';plot_file='Cordova'; %% 

    end

             if subregion==76
        Poly=[
        -143.5 61.5
        -143.5 60
        -142 60
        -142 61.5
        -143.5 61.5
        
            ];
                 name='Cordova East';plot_file='CordovaEast'; %% 

    end
      
 if subregion==77
        Poly=[
            -142 60.655
            -142 59.93
            -141.43 59.93
%             -141.43 59.8
            -141.43 60.33
            -141.2 60.33
            -141.2 60.655
            -142 60.655
%             -141.6 60.655
%             -141.6 60.62
%              -142 60.35
%              -141.8 60.1 
%                -141.55 60
%               -141.55 59.8
%              -141.43 59.8
            ];
                 name='Icy Bay';plot_file='IcyBay'; %% 
 end
    
 if subregion==78
        Poly=[
            -141.43 59.7
            -141.43 60.33
            -141.2 60.33
            -141.2 60.655
            -141 60.655
            -141 59.7
            -141.43 59.7
            ];
                 name='Point Riou';plot_file='PtRiou'; %% 
 end
     if subregion==79
        Poly=[
            -141 59.7
            -141 60.655
            -140.7 60.655
            -140.6 60.1
            -140.6 59.7
            -141 59.7
            ];
                 name='Point Manby';plot_file='PtManby'; %% 
     end

      if subregion==80
        Poly=[
          
            -140.7 60.655
            -140.6 60.1
            -140.6 59.7
            -140 59.7
            -140 60.655
            -140.7 60.655
            ];
                 name='Malaspina';plot_file='Malaspina'; %% 
      end
      if subregion==81
        Poly=[
          
            -138.5 60.655
            -138.5 59
            -140 59
            -140 60.655
            -138.5 60.655
            ];
                 name='Yakutat';plot_file='Yakutat'; %% 
    end

 if subregion==82
        Poly=[
          
            -136.8 60
            -136.8 59.6
            -136 59.6
            -136 60
            -136.8 60
            ];
                 name='Bear Camp';plot_file='BearCamp'; %% 
 end
       if subregion==83
        Poly=[
          
            -138.5 60.655
            -138.5 58
            -137 58
            -137 60.655
            -138.5 60.655
            ];
                 name='Alsek';plot_file='Alsek'; %% 
       end
      
         if subregion==84
        Poly=[
          
            -137 55.9
          -135.5 55.9
          -135.5 59.6
          -137 59.6
          -137 55.9];
           
                 name='Glacier Bay';plot_file='GlacierBay'; %% 
         end
      
         if subregion==85
        Poly=[
          -137 57.5
          -130 55.9
          -130 51.6
          -137 51.6
          -137 57.5];
           
                 name='Ketchikan';plot_file='Ketchikan'; %% 
         end
         
          if subregion==86
        Poly=[
          -137 50.95
          -130.1 50.95
          -130.1 51.6
          -137 51.6
          -137 50.95];
           
                 name='Scott Islands';plot_file='ScottIslands'; %% 
          end
         
            if subregion==87
        Poly=[
          -130.1 48.5
          -130.1 51.6
          -129.15 51.6
          -129.15 48
          -130.1 48.5
          ];
                 name='Hardy';plot_file='Hardy'; %% 
            end
         
              if subregion==88
        Poly=[
          -128 47
          -128 51.6
          -129.15 51.6
          -129.15 47
          -128 47
          ];
                 name='Tofino';plot_file='Tofino'; %% 
         end
                    if subregion==89
Poly=[-164 56
      -164 53
      -159 53
      -159 56
      -164 56 ];
                 name='Chignik';plot_file='Chignik'; %% 
                    end
         
 if subregion==90
Poly=[-180 56
      -180 68
      -170 68
      -170 64
      -164 56
      -164 54
      -166 54
      -166 56
      -180 56];
     
                 name='Bering';plot_file='Bering'; %% 
 end
     if subregion==91
 Poly=[-164 54
      -166 54
      -167 53
      -167.5 53
      -167.5 52
      -164 52
      -164 54];
                 name='Akutan';plot_file='Akutan'; %% 
     end
                    
     if subregion==92
 Poly=[
      -167.5 53.1
      -167.5 52
      -169 52
      -169 53.1
      -167.5 53.1];
     name='Umnak';plot_file='Umnak'; %% 
     end
    
     if subregion==93
 Poly=[
      -172 51.5
      -172 52.5
      -169 52.5
      -169 51.5
      -172 51.5];
     name='Amukta';plot_file='Amukta'; %% 
     end
    
      if subregion==94
 Poly=[
      -172 51
      -172 52.25
      -174 52.25
      -174 51
      -172 51];
     name='East Atka';plot_file='EastAtka'; %% 
      end
    
      if subregion==95
 Poly=[
      -175.3 51
      -175.3 52.25
      -174 52.25
      -174 51
      -175.3 51];
     name='West Atka';plot_file='EastAtka'; %% 
      end
    
       if subregion==96
 Poly=[
      -175.3 50.75
      -175.3 52
      -177.5 52
      -177.5 50.75
      -175.3 50.75];
     name='Adak';plot_file='Adak'; %% 
       end
    
         if subregion==97
 Poly=[
      -180 50.5
      -180 51.5
      -177.5 51.5
      -177.5 50.5
      -180 50.5];
     name='Kanaga';plot_file='Kanaga'; %% 
         end
    
           if subregion==98
 Poly=[
      -169 52.5
      -172 52.5
      -172 52.25
      -175.5 52.25
      -175.5 54
      -169 54
      -169 52.5];
     
     name='Yunaska';plot_file='Yunaska'; %% 
           end
    
              if subregion==99
 Poly=[
      -180 51.5
      -180 52.5
      -177.5 52.5
      -177.5 51.5
      -180 51.5];
     name='Tanaga';plot_file='Tanaga'; %% 
         end