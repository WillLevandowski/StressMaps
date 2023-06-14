cc
setcrustalFMs
toplot=1;subregion=1;
  Poly=[
         
        -147 61.9
-147.05 61
-146.9 61
-146.2 61.56
-146.2 61.8
-147 61.9];
xlim([min(Poly(:,1)) max(Poly(:,1))])
ylim([min(Poly(:,2)) max(Poly(:,2))])
classifyAndPlotAKnormal


MannWindow=[-146.8 64.2;-145.8 61.8; -145.7 62.5];
% toplot=0;
figure(1);
view(86,0)
% zlim([-60 0])
plot3(Lon(type==0.5 ),Lat(type==0.5 ),-z(type==0.5 ),'o','markerfacecolor',[1 0 0],'markeredgecolor',[1 0 0],'markersize',3);
% plot3(Lon(type==0.5 & z<40 & z>=30),Lat(type==0.5 & z<40 & z>=30),-z(type==0.5 & z<40 & z>=30),'o','markerfacecolor',[1 0.5 0],'markeredgecolor',[1 0.5 0],'markersize',3);
% plot3(Lon(type==0.5 & z<30 & z>=20),Lat(type==0.5 & z<30 & z>=20),-z(type==0.5 & z<30 & z>=20),'o','markerfacecolor',[1 1 0],'markeredgecolor',[0.5 0.5 0],'markersize',3);
% plot3(Lon(type==0.5 & z<20 ),Lat(type==0.5 & z<20),-z(type==0.5 & z<20),'o','markerfacecolor',[1 0 1],'markeredgecolor',[1 0 1],'markersize',3);
% plot3(Lon(type==0.5 & z>=25),Lat(type==0.5  & z>=25),-z(type==0.5  & z>=25),'o','markerfacecolor',[1 1 0],'markeredgecolor',[1 1 0],'markersize',5);


plot3(Lon(type==1),Lat(type==1),-z(type==1),'o','markerfacecolor',[1 0.5 0],'markeredgecolor',[1 0.5 0],'markersize',3);
plot3(Lon(type==1.45),Lat(type==1.45),-z(type==1.45),'o','markerfacecolor',[0 0.8 0],'markeredgecolor',[0 0.8 0],'markersize',3);
plot3(Lon(type==1.5),Lat(type==1.5),-z(type==1.5),'o','markerfacecolor',[0 0.8 0],'markeredgecolor',[0 0.8 0],'markersize',3);
plot3(Lon(type==1.55),Lat(type==1.55),-z(type==1.55),'o','markerfacecolor',[0 0.8 0],'markeredgecolor',[0 0.8 0],'markersize',3);
plot3(Lon(type==2),Lat(type==2),-z(type==2),'o','markerfacecolor',[0 1 1],'markeredgecolor',[0 1 1],'markersize',3);
plot3(Lon(type==2.5),Lat(type==2.5),-z(type==2.5),'o','markerfacecolor',[0 0 1],'markeredgecolor',[0 0 1],'markersize',3);

Lon_all=Lon;Lat_all=Lat;z_all=z;mechs_all=mechs;
type_all=type;SH_all=SH;

% 
% 
% figure
% plot(Lon,Lat,'ko');hold on
% plot(Lon(year<2008),Lat(year<2008),'bo');hold on


dlmwrite('locs2008.txt',[Lon(year<2009) Lat(year<2009) ],'\t')
dlmwrite('locs2023.txt',[Lon(year>=2009) Lat(year>=2009) ],'\t')


z(z<0)=0;

figure;hold on;grid on
% xlim([-170 -119]) % ylim([50 70.5])% dx=Lon--145;dx=dx.*cosd(Lat)*111;% dy=(Lat-50)*111;% Lon=dx;% Lat=dy;

for i=1:length(Lon)

    if type(i)==0.5
        plot(Lon(i),Lat(i),'o','color',[1 0 0],'linewidth',0.5)

    end
    if type(i)==1.0
                plot(Lon(i),Lat(i),'o','color',[1 0.25 0.25],'linewidth',0.5)

    end
    if type(i)==1.45
                plot(Lon(i),Lat(i),'o','color',[0.6 0.45 0.45],'linewidth',0.5)

    end
     if type(i)==1.5
                plot(Lon(i),Lat(i),'o','color',[0.5 0.5 0.5],'linewidth',0.5)

     end
     if type(i)==1.55
                plot(Lon(i),Lat(i),'o','color',[0.45 0.45 0.6],'linewidth',0.5)

    end
    if type(i)==2.0
                plot(Lon(i),Lat(i),'o','color',[0.25 0.25 1],'linewidth',0.5)

    end
    if type(i)==2.5
                plot(Lon(i),Lat(i),'o','color',[0 0 1],'linewidth',0.5)

    end
end
% % axis equal
% 
% % xlim([-1100 1100])
% 

mark=0*Lon_all;
buildAlaskapolygons
mechSH=SH;
mechtype=type;
allvertices=[];



%%
for subregion=1
 
  if subregion ==1
     Poly=[
         
        -147 61.9
-147.05 61
-146.9 61
-146.2 61.56
-146.2 61.8
-147 61.9];

     
         
     name='Chugach';plot_file='Chugach'; %% 
  end
  
%   if subregion ==13
%      Poly=[
%          
% %         -145.5 65.4
%         -147 65
%         -147 66
%         -147.3 66.8
%         -147.3 66.85
%         -147 66.85
%         -146.8 66.6
%         -143 65.6
%          -143 64.8
%          -147 65
% %          -145.5 65.4
%         ];
%          
%          
%      name='Tintina';plot_file='Tintina'; %% 
% % %      FranklinMtnsPoly;name='FranklinMtns';plot_file='FranklinMtns';
%   end
%   if subregion==14;
%       Poly=[
%           -158 67
%           -158 64
%           -153 64
%           -153 67
%           -158 67];
%              name='Kaltag';plot_file='Kaltag'; %% 
% 
%   end
 
toplot=0;if subregion==1;toplot=1;end
within=find(inpolygon(Lon_all,Lat_all,Poly(:,1),Poly(:,2)) );%& z<=26 & (Lat>61 | z<15 | Lon>-140 | Lon<-150) & (Lon>-146 | Lon<-148.5 | Lat>62) & (Lon>-141.4 | Lon<-142 | Lat>62));
% within=unique(within);
% within=[within;within;within];
Lon=Lon_all(within);Lat=Lat_all(within);z=z_all(within);
mechs=mechs_all(within,:);
D=ones(length(within),1);
% D(Lon<-146 | Lat>66 | Lat<65| Lon>-144)=10;

 tx=mean(Lon);ty=mean(Lat);
% if subregion~=1;
    mark(within)=mark(within)+1;
     figure(2);
    text(tx,ty,name,'HorizontalAlignment','center');
plotpt(Poly,'k')
% end

     runAlaskaSubregionInversion
     strike1=mechs(:,1);

     StressStereonet2

set(gcf,'position',[1 509 378 357])

saveas(gcf,plot_file,'jpg')



%% 
tau=mean(tau_all,3);
friction=friction_mean;
          strike=SDR(:,3);dip=SDR(:,4);rake=SDR(:,5);
    [strike1,dip1,rake1,strike2,dip2,rake2]=aux_planes(strike,dip,rake);

 [strike_best,dip_best,rake_best,instability] = stability_criterion(tau,friction,strike1,dip1,rake1,strike2,dip2,rake2);
       tau2 = linear_stress_inversion_DistWeighted(strike_best,dip_best,rake_best,ones(length(strike_best),1)');
        [strike_best,dip_best,rake_best,instability] = stability_criterion(tau2,friction,strike1,dip1,rake1,strike2,dip2,rake2);
       tau3 = linear_stress_inversion_DistWeighted(strike_best,dip_best,rake_best,ones(length(strike_best),1)');

        [strike_best,dip_best,rake_best,instability] = stability_criterion(tau3,friction,strike1,dip1,rake1,strike2,dip2,rake2);
       tau4 = linear_stress_inversion_DistWeighted(strike_best,dip_best,rake_best,ones(length(strike_best),1)');

           [strike_best,dip_best,rake_best,instability] = stability_criterion(tau4,friction,strike1,dip1,rake1,strike2,dip2,rake2);
       tau5 = linear_stress_inversion_DistWeighted(strike_best,dip_best,rake_best,ones(length(strike_best),1)');
tau=tau5;
[~,~,~,strike_worse,dip_worse,rake_worse]=aux_planes(strike_best,dip_best,rake_best);
      FSPAlaska
%  output(subregion,:)=[mean(Lon) mean(Lat) A_phi SHmax 0.6];
 
%  allvertices=[allvertices;999 999;Poly];
 

 
end
%%
a=load('Tintina5.txt');
azs=zeros(length(a)-1,1);
for i=1:length(a)-1
azs(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
end

[tx,ty]=strikedip_toStereo(azs,0*azs+89.9);
[tx2,ty2]=strikedip_toStereo(azs+180,0*azs+89.9);
fsps=F(tx,ty);
fsps2=F(tx2,ty2);
swap=find(fsps2<fsps);

tx(swap)=tx2(swap);
ty(swap)=ty2(swap);
fsps(swap)=fsps2(swap);
azs(swap)=azs(swap)+180;
startlon=a(1:end-1,1);
startlat=a(1:end-1,2);
endlon=a(2:end,1);
endlat=a(2:end,2);

v=[ tx ty fsps azs startlon startlat endlon endlat];



a=load('Tintina4.txt');
azs=zeros(length(a)-1,1);
for i=1:length(a)-1
azs(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
end
[tx,ty]=strikedip_toStereo(azs,0*azs+89);
[tx2,ty2]=strikedip_toStereo(azs+180,0*azs+89);
fsps=F(tx,ty);
fsps2=F(tx2,ty2);
swap=find(fsps2<fsps);
tx(swap)=tx2(swap);
ty(swap)=ty2(swap);
fsps(swap)=fsps2(swap);
azs(swap)=azs(swap)+180;
startlon=a(1:end-1,1);
startlat=a(1:end-1,2);
endlon=a(2:end,1);
endlat=a(2:end,2);
v=[v;[ tx ty fsps azs startlon startlat endlon endlat]];

a=load('Tintina3.txt');
azs=zeros(length(a)-1,1);
for i=1:length(a)-1
azs(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
end
[tx,ty]=strikedip_toStereo(azs,0*azs+89);
[tx2,ty2]=strikedip_toStereo(azs+180,0*azs+89);
fsps=F(tx,ty);
fsps2=F(tx2,ty2);
swap=find(fsps2<fsps);
tx(swap)=tx2(swap);
ty(swap)=ty2(swap);
fsps(swap)=fsps2(swap);
azs(swap)=azs(swap)+180;
startlon=a(1:end-1,1);
startlat=a(1:end-1,2);
endlon=a(2:end,1);
endlat=a(2:end,2);
v=[v;[ tx ty fsps azs startlon startlat endlon endlat]];


a=load('Tintina2.txt');
azs=zeros(length(a)-1,1);
for i=1:length(a)-1
azs(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
end
[tx,ty]=strikedip_toStereo(azs,0*azs+89);
[tx2,ty2]=strikedip_toStereo(azs+180,0*azs+89);
fsps=F(tx,ty);
fsps2=F(tx2,ty2);
swap=find(fsps2<fsps);
tx(swap)=tx2(swap);
ty(swap)=ty2(swap);
fsps(swap)=fsps2(swap);
azs(swap)=azs(swap)+180;
startlon=a(1:end-1,1);
startlat=a(1:end-1,2);
endlon=a(2:end,1);
endlat=a(2:end,2);
v=[v;[ tx ty fsps azs startlon startlat endlon endlat]];


a=load('Tintina1.txt');
azs=zeros(length(a)-1,1);
for i=1:length(a)-1
azs(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
end
[tx,ty]=strikedip_toStereo(azs,0*azs+89);
[tx2,ty2]=strikedip_toStereo(azs+180,0*azs+89);
fsps=F(tx,ty);
fsps2=F(tx2,ty2);
swap=find(fsps2<fsps);
tx(swap)=tx2(swap);
ty(swap)=ty2(swap);
fsps(swap)=fsps2(swap);
azs(swap)=azs(swap)+180;
startlon=a(1:end-1,1);
startlat=a(1:end-1,2);
endlon=a(2:end,1);
endlat=a(2:end,2);
v=[v;[ tx ty fsps azs startlon startlat endlon endlat]];

a=[-141 64.68;-139.5 64.297;-138.4 63.93;-136.5 63.33;-133.30 62.24;-132.56 61.98;-132.07 61.71;-130.73 61.16];
azs=zeros(length(a)-1,1);
for i=1:length(a)-1
azs(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
end
[tx,ty]=strikedip_toStereo(azs,0*azs+89);
[tx2,ty2]=strikedip_toStereo(azs+180,0*azs+89);
fsps=F(tx,ty);
fsps2=F(tx2,ty2);
swap=find(fsps2<fsps);
tx(swap)=tx2(swap);
ty(swap)=ty2(swap);
fsps(swap)=fsps2(swap);
azs(swap)=azs(swap)+180;
startlon=a(1:end-1,1);
startlat=a(1:end-1,2);
endlon=a(2:end,1);
endlat=a(2:end,2);
v=[v;[ tx ty fsps azs startlon startlat endlon endlat]];

plot(v(:,1),v(:,2),'k^')

% greenfile=[];
% redfile=[];
% yellowfile=[];
% for i=1:length(v)
%     if v(i,3)>15 
%         greenfile=[greenfile;
%             v(i,5:6);
%             v(i,7:8);
%             999 999];
%     end
%     if v(i,3)>3 && v(i,3)<=15
%         yellowfile=[yellowfile;
%             v(i,5:6);
%             v(i,7:8);
%             999 999];
%     end
%      if v(i,3)<3
%         redfile=[redfile;
%             v(i,5:6);
%             v(i,7:8);
%             999 999];
%     end
% end
% 
% dlmwrite('redfile.txt',redfile,'\t');
% dlmwrite('yellowfile.txt',yellowfile,'\t');
% dlmwrite('greenfile.txt',greenfile,'\t');
    

%%
figure;hist(v(:,3),100);title(quantile(v(:,3),0.1))

figure;hold on
% 
% 
% greenfile=[];
% redfile=[];
% yellowfile=[];
for i=1:length(v)
    if v(i,3)>10 
        plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'g','linewidth',5);
%         greenfile=[greenfile;
%             v(i,5:6);
%             v(i,7:8);
%             999 999];
    end
    if v(i,3)>5 && v(i,3)<=15
                plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'y','linewidth',5);

%         yellowfile=[yellowfile;
%             v(i,5:6);
%             v(i,7:8);
%             999 999];
    end
     if v(i,3)>2.5 && v(i,3)<=5
                plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'color',[1 0.5 0],'linewidth',5);
    end
     if v(i,3)<2.5
          plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'r','linewidth',5);

    end
end

axis equal
xlim([-146.5 -140])
ylim([64.5 66])
set(gcf,'Menu','none','Toolbar','none','position',[1 1 1001 231]);

set(gca,'units','normalize','position',[-0.0 0 1 1],'color','none','TickLength',[0.0;0.0])
 saveas(gcf,'TintinaStoplight','png');

 [img1 ,~]=imread('TintinaStoplight.png');img=double(img1);

 lon1=[-146.5 -140; 
     -146.5 -140];
 lat1=[66 66; 
    64.5 64.5];
 
 makekmz(img,lat1,lon1,'imname','TintinaStoplight_Wmodel');


xlim([-146.5 -130])
ylim([61 66])
set(gcf,'Menu','none','Toolbar','none','position',[1 1 996 303]);

set(gca,'units','normalize','position',[-0.0 0 1 1],'color','none','TickLength',[0.0;0.0])
 saveas(gcf,'TintinaBigStoplight','png');

 [img1 ,~]=imread('TintinaBigStoplight.png');img=double(img1);

 lon1=[-146.5 -130; 
     -146.5 -130];
 lat1=[66 66; 
    61 61];
 
 makekmz(img,lat1,lon1,'imname','TintinaBigStoplight_Wmodel');

% 
% azs4=zeros(length(a)-1,1);
% for i=1:length(a)-1
% azs4(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
% end
% 
% [tx4,ty4]=strikedip_toStereo(azs4,0*azs4+89);
% fsps4=F(tx4,ty4);
% plot(tx4,ty4,'k^')
% 
% 
% 
% a=load('Tintina3.txt');
% azs3=zeros(length(a)-1,1);
% for i=1:length(a)-1
% azs3(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
% end
% 
% [tx3,ty3]=strikedip_toStereo(azs3,0*azs3+89);
% fsps3=F(tx3,ty3);
% plot(tx3,ty3,'k^')
% 
% 
% 
% a=load('Tintina2.txt');
% azs2=zeros(length(a)-1,1);
% for i=1:length(a)-1
% azs2(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
% end
% 
% [tx2,ty2]=strikedip_toStereo(azs2,0*azs2+89);
% fsps2=F(tx2,ty2);
% plot(tx2,ty2,'k^')
% 
% 
% 
% a=load('Tintina1.txt');
% azs1=zeros(length(a)-1,1);
% for i=1:length(a)-1
% azs1(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
% end
% 
% [tx1,ty1]=strikedip_toStereo(azs1,0*azs1+89);
% fsps1=F(tx1,ty1);
% plot(tx1,ty1,'k^')