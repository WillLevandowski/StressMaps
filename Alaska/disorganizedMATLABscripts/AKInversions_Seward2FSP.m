cc
setcrustalFMs
toplot=1;subregion=1;classifyAndPlot
Lon_all=Lon;Lat_all=Lat;z_all=z;mechs_all=mechs;
mark=0*Lon_all;
buildAlaskapolygons
mechSH=SH;
mechtype=type;
allvertices=[];
%%
for subregion=2
 definePolygonSubregions
within=find(inpolygon(Lon_all,Lat_all,Poly(:,1),Poly(:,2)) );%& z<=26 & (Lat>61 | z<15 | Lon>-140 | Lon<-150) & (Lon>-146 | Lon<-148.5 | Lat>62) & (Lon>-141.4 | Lon<-142 | Lat>62));
within=unique(within);Lon=Lon_all(within);Lat=Lat_all(within);z=z_all(within);
mechs=mechs_all(within,:);D=ones(length(within),1);
     runAlaskaSubregionInversion
      FSPAlaska
     strike1=mechs(:,1);StressStereonet2;set(gcf,'position',[1 509 378 357]);saveas(gcf,plot_file,'jpg')

end


%%
a=load('SewardFaults.txt');

 
 F=scatteredInterpolant(strike_,dip_,mean_dP,'linear','none');
azs=zeros(length(a)-1,1);
for i=1:length(a)-1
azs(i)= azimuth(a(i,2),a(i,1),a(i+1,2),a(i+1,1));
end
azs0=azs;azs1=azs0+180;
% azs(azs<180)=azs(azs<180)+180;
fsp=F(azs0,60+0*azs);
fsp2=F(azs1,60+0*azs);
dips=0*azs+60;
for i=1:length(fsp)
    if fsp2(i)<fsp(i);azs(i)=azs1(i);fsp(i)=fsp2(i);end
end
azs(azs>360)=azs(azs>360)-360;

for ang=50:89
fsp2=F(azs1,ang+0*azs);
for i=1:length(fsp)
    if fsp2(i)<fsp(i);azs(i)=azs1(i);fsp(i)=fsp2(i);dips(i)=ang;end
end
fsp2=F(azs0,ang+0*azs);
for i=1:length(fsp)
    if fsp2(i)<fsp(i);azs(i)=azs0(i);fsp(i)=fsp2(i);dips(i)=ang;end
end
end
% 
% fsp2=F(azs0,70+0*azs);
% for i=1:length(fsp)
%     if fsp2(i)<fsp(i);azs(i)=azs0(i);fsp(i)=fsp2(i);dips(i)=70;end
% end
% 
% fsp2=F(azs1,80+0*azs);
% for i=1:length(fsp)
%     if fsp2(i)<fsp(i);azs(i)=azs1(i);fsp(i)=fsp2(i);dips(i)=80;end
% end
% 
% fsp2=F(azs0,80+0*azs);
% for i=1:length(fsp)
%     if fsp2(i)<fsp(i);azs(i)=azs0(i);fsp(i)=fsp2(i);dips(i)=80;end
% end
% 
% 
% fsp2=F(azs1,89+0*azs);
% for i=1:length(fsp)
%     if fsp2(i)<fsp(i);azs(i)=azs1(i);fsp(i)=fsp2(i);dips(i)=89;end
% end
% 
% fsp2=F(azs0,89+0*azs);
% for i=1:length(fsp)
%     if fsp2(i)<fsp(i);azs(i)=azs0(i);fsp(i)=fsp2(i);dips(i)=89;end
% end

startlon=a(1:end-1,1);
startlat=a(1:end-1,2);
endlon=a(2:end,1);
endlat=a(2:end,2);
v=[ fsp azs fsp azs startlon startlat endlon endlat];

okay=find(startlon~=999 & endlon~=999);
v=v(okay,:);
% 
% [xp1,yp1]=strikedip_toStereo(azs,dips);
% plot(xp1,yp1,'ko')
% v=[v(:,1:2) v];

qs=[2 5 15];
    
    figure;hold on
for i=1:length(v)
    if v(i,3)>qs(3)
        plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'g','linewidth',5);

    end
    if v(i,3)>=qs(2) && v(i,3)<=qs(3)
                plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'y','linewidth',5);


    end
     if v(i,3)>=qs(1) && v(i,3)<qs(2)
          plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'color',[1 0.5 0],'linewidth',5);
    end
     if v(i,3)<qs(1)
          plot( [v(i,5) v(i,7)], [v(i,6) v(i,8)], 'r','linewidth',5);
    end
end

axis equal
%%
xlim([-166.25 -162.5]);ylim([64.6 65.5])

% plotpt(b,'k')
% plotpt(c,'k')

set(gcf,'Menu','none','Toolbar','none','position',[1 1 1162 280]);

set(gca,'units','normalize','position',[-0.0 0 1 1],'color','none','TickLength',[0.0;0.0])
%%
saveas(gcf,'SPStoplight','png');

 [img1 ,~]=imread('SPStoplight.png');img=double(img1);

 lon1=[-166.25 -162.5; 
     -166.25 -162.5];
 lat1=[65.5 65.5
    64.6 64.6];
 
 makekmz(img,lat1,lon1,'imname','SPStoplight_DRmodel');
