cc
setcrustalFMs
toplot=1;subregion=1;
classifyAndPlot
% % Lon=Lon(within);Lat=Lat(within);z=z(within);mechs=mechs(within,:);year=year(within);
% 
% 
% 
% 
% % figure
% % plot(Lon,Lat,'ko');hold on
% % plot(Lon(year<2008),Lat(year<2008),'bo');hold on
% 
% 
% % toplot=1;subregion=1;
% % classifyAndPlot
% Lon_all=Lon;Lat_all=Lat;z_all=z;mechs_all=mechs;
% 
% z(z<0)=0;
% 
% figure;hold on;grid on
% % xlim([-170 -119]) % ylim([50 70.5])% dx=Lon--145;dx=dx.*cosd(Lat)*111;% dy=(Lat-50)*111;% Lon=dx;% Lat=dy;
% 
% for i=1:length(Lon)
% 
%     if type(i)==0.5
%         plot(Lon(i),Lat(i),'o','color',[1 0 0],'linewidth',0.5)
% 
%     end
%     if type(i)==1.0
%                 plot(Lon(i),Lat(i),'o','color',[1 0.25 0.25],'linewidth',0.5)
% 
%     end
%     if type(i)==1.45
%                 plot(Lon(i),Lat(i),'o','color',[0.6 0.45 0.45],'linewidth',0.5)
% 
%     end
%      if type(i)==1.5
%                 plot(Lon(i),Lat(i),'o','color',[0.5 0.5 0.5],'linewidth',0.5)
% 
%      end
%      if type(i)==1.55
%                 plot(Lon(i),Lat(i),'o','color',[0.45 0.45 0.6],'linewidth',0.5)
% 
%     end
%     if type(i)==2.0
%                 plot(Lon(i),Lat(i),'o','color',[0.25 0.25 1],'linewidth',0.5)
% 
%     end
%     if type(i)==2.5
%                 plot(Lon(i),Lat(i),'o','color',[0 0 1],'linewidth',0.5)
% 
%     end
% end
% % % axis equal
% % 
% % % xlim([-1100 1100])
% % 
% %%
% SH0=mod(SH,180);
% smoothSH=SH0;
% 
% 
% type0=type;
% for i=1:length(SH0)
%     dx=Lon-Lon(i);dx=dx.*cosd(Lat(i));
%     dy=Lat-Lat(i);
%     dr=sqrt( (dx*113.12).^2 + (dy*110.57).^2);
%     near=find(dr<50);
%     
%     if Lat(i)>44 && Lon(i)>-79;near=find(dr<300);end
%     if length(near)>1
%         s=SH0(near);
%         dr=dr(near);
%         s(s>median(s)+90)=s(s>median(s)+90)-180;
%         s(s<median(s)-90)=s(s<median(s)-90)+180;
%          s(s>median(s)+90)=s(s>median(s)+90)-180;
%         s(s<median(s)-90)=s(s<median(s)-90)+180;
%          s(s>mean(s)+90)=s(s>mean(s)+90)-180;
%         s(s<mean(s)-90)=s(s<mean(s)-90)+180;
%         
%         weights=exp(-dr.^2 / (2*2).^2);
%        if Lat(i)>44 && Lon(i)>-79;weights=exp(-dr.^2 / (2*5).^2);end
% 
%         weights=weights/sum(weights);
%         smoothSH(i)=dot(weights,s);
%         s(s>smoothSH(i)+90)=s(s>smoothSH(i)+90)-180;
%         s(s<smoothSH(i)-90)=s(s<smoothSH(i)-90)+180;
%         smoothSH(i)=dot(weights,s);
%         s(s>smoothSH(i)+90)=s(s>smoothSH(i)+90)-180;
%         s(s<smoothSH(i)-90)=s(s<smoothSH(i)-90)+180;
%         smoothSH(i)=dot(weights,s);
%        
%         type0(i)=dot(weights,type(near));
% %         if length(near)>4
% % %         if range(s)>180
% %             pause
% %         end
%     end
% end
% 
% foo=find(smoothSH>SH0+90);smoothSH(foo)=smoothSH(foo)-180;
% foo1=find(smoothSH<SH0-90);smoothSH(foo1)=smoothSH(foo1)+180;
% dlmwrite('smoothAlaska_Paxes', [Lon Lat type0 smoothSH 0*SH0+0.4], '\t')
% %%
mark=0*Lon_all;
buildAlaskapolygons
mechSH=SH;
mechtype=type;
allvertices=[];

WAK=[-170 54
-159.25 60
-155.5 62
-153 63
-152 64
-150.9 64
-150 65
-149.5 65.5
-147.5 65.25
-148.1 66
-148.1 67
-147.25 67.25
-147.25 67.5
-148 67.75
-150 68
-170 70
-185 50
-170 50
-170 54
];
plotpt(WAK,'k')

Minto=[
    -150.4 64.5 
-149 64.5
-148.5 64.4
-148 64.3
-146.5 64.3
-146.5 64.6
-147.5 65.25
-149.5 65.5
-150 65
-150.4 64.5];
plotpt(Minto,'g')







%%
for subregion=2:84
 if subregion == 1
     Poly=AlaskaPoly;name='All Alaska';plot_file='Alaska';
 end

  if subregion == 2
     Poly=[-170 64
         -170 66.5 
         -160 66.5
         -160 64
         -170 64];
     name='Shishmaref';plot_file='Shishmaref'; %% 
%      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
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
         -135.5 56
         -135.5 60
         -137 61.5
         -140 62.5
           -140 64
           -132 64
           -132 70
           -119 70
           -119 55.9
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
        -166 50
        -182 50
        -182 52
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
%     if subregion==75
%         Poly=[
%             -145.5 61
%             -145.5 59.5
%             -146.5 59.5
%             -146.5 57
%             -141 57
%             -141 59
%             -143.5 59
%             -143.5 60
%             -143.71 60
%             -143.71 61
%             -145.5 61
%             
% %             -147.75 59.5
% %             -147.75 59
% %             -147.75 57.5
% %             -141 57.5
% %             -141 59
% %             -143.6 59
% %             -143.6 61
% %             -145.5 61
%             ];
%                  name='Cordova';plot_file='Cordova'; %% 
% 
%     end

             if subregion==76
        Poly=[
%             -143.71 61
%             -143.71 60
-145.5  61
-145.5 59.5
            -142 59.5
            -142 61
            -143.71 61
%              -143 61
%             -143 60
%             -142 59.8
%             
%             -141.55 59.8
%             -141.55 60
%             -141.8 60.1 
%             -142 60.35
%             -141.6 60.62
%             -141.6 60.67
%             -143 61
            ];
                 name='CordovaEast';plot_file='CordovaEast'; %% 

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
      
         if subregion==75
        Poly=[
          
            -135.5 59.6
            -135.5 55.9
            -134 55.9
            -134 55
            -137 55
            -137 59.6
            -135.5 59.6
            ];
                 name='Glacier Bay';plot_file='GlacierBay'; %% 
      end
toplot=0;if subregion==1;toplot=1;end
within=find(inpolygon(Lon_all,Lat_all,Poly(:,1),Poly(:,2)) );%& z<=26 & (Lat>61 | z<15 | Lon>-140 | Lon<-150) & (Lon>-146 | Lon<-148.5 | Lat>62) & (Lon>-141.4 | Lon<-142 | Lat>62));
within=unique(within);
Lon=Lon_all(within);Lat=Lat_all(within);z=z_all(within);
mechs=mechs_all(within,:);
D=ones(length(within),1);

 tx=mean(Lon);ty=mean(Lat);
if subregion~=1
    mark(within)=mark(within)+1;
     figure(2);
    text(tx,ty,name,'HorizontalAlignment','center');
plotpt(Poly,'k')
end
% tic
     runAlaskaSubregionInversion
%      toc
% % %      FSPAlaska
 output(subregion,:)=[mean(Lon) mean(Lat) A_phi SHmax 0.6];
 output2(subregion,:)=[mean(Lon) mean(Lat) A_phi_low SHmax_max2 1];
 output3(subregion,:)=[mean(Lon) mean(Lat) A_phi_high SHmax_min2 1];
 output4(subregion,:)=[mean(Lon) mean(Lat) A_phi_high SHmax_max2 1];
 output5(subregion,:)=[mean(Lon) mean(Lat) A_phi_low SHmax_min2 1];
% % %  
 allvertices=[allvertices;999 999;Poly];
%  
 if length(within)<25
      fprintf([name ' has ' num2str(length(within)) ' data \n'])
 end
 if var(aphi)>0.2
      fprintf([name ' has aphi variance ' num2str(var(aphi)) ' \n'])
 end
 strike1=mechs(:,1);

     StressStereonet2

set(gcf,'position',[1 509 378 357])

saveas(gcf,plot_file,'jpg')
pause(0.01)
      fprintf([name ' has aphi variance ' num2str(var(aphi)) ' \n'])
end

%%
plot(Lon_all(mark==0),Lat_all(mark==0),'g*','markersize',30)
%  unused=[Lon_all(mark==0) Lat_all(mark==0) mechtype(mark==0) mechSH(mark==0) 0.3+0*mechSH(mark==0)];
allvertices(allvertices<-179.99)=-179.99;
dlmwrite('AKPaxes4',output(2:end,:),'\t')
% dlmwrite('AKPaxes4_lowmax',output2(2:end,:),'\t')
% dlmwrite('AKPaxes4_highmin',output3(2:end,:),'\t')
% dlmwrite('AKPaxes4_highmax',output4(2:end,:),'\t')
% dlmwrite('AKPaxes4_lowmin',output5(2:end,:),'\t')
% % % % % dlmwrite('unusedPaxes3',unused,'\t')
dlmwrite('BoxVertices',allvertices,'\t')
