siteLon=-155;siteLat=65;
a=load('AlaskaMTs2.txt');
 okay=find(a(:,8)<-110 & a(:,7)>47);
 a=a(okay,:);
Lon=a(:,8);Lat=a(:,7);z=a(:,9);mechs=a(:,11:16);
ocean=[-165 54
    -148 60.5 
    -140 58 
    -135 54
    -165 54];

count=0;
a2=load('focal_mechanisms_Alaska.dat');
% okay=find(a2(:,9)<-146 & a2(:,9)>-149.25);
% a2=a2(okay,:);
for i=1:length(a2)
    
    repeat=find(a(:,1)==a2(i,3) & a(:,2)==a2(i,1) & a(:,3)==a2(i,2) ...
        & a(:,4)==a2(i,5)  & a(:,5)==a2(i,6)  & abs(a(:,8)-a2(i,9))<0.2 ...
        & abs(a(:,7)-a2(i,8))<0.2 & abs(a(:,9)-a2(i,10))<5  );
    if ~isempty(repeat)
       count=count+1;
       a2(i,:)=999;
    end
end

okay=find(a2(:,2)<32);
a2=a2(okay,:);
% 
% Lon=[Lon;a2(:,9)];
% Lat=[Lat;a2(:,8)];
% z=[z;a2(:,10)];
% mechs=[mechs;a2(:,12:17)];
% year=[a(:,1);a2(:,3)];

a3=load('CMT_westAlaska.txt');
a4=load('CMT_eastAlaska.txt');
Lon=[Lon;a2(:,9);a3(:,1);a4(:,1)];
Lat=[Lat;a2(:,8);a3(:,2);a4(:,2)];
z=[z;a2(:,10);a3(:,9);a4(:,9)];
mechs=[mechs;a2(:,12:17);a3(:,3:8);a4(:,3:8)];
year=[a(:,1);a2(:,3);a3(:,10);a4(:,10)];



a5=load('CMT_centralAlaska.txt');
yr5=a5(:,10);lon5=a5(:,1);lat5=a5(:,2);
for i=1:length(a5)
    match=find( abs(Lon-lon5(i))<0.2 & abs(Lat-lat5(i))<0.1 & year==yr5(i));
    if ~isempty(match)
        a5(i,:)=0;
    end
end
a5=a5( a5(:,2)>0,:);
Lon=[Lon;a5(:,1)];
Lat=[Lat;a5(:,2)];
z=[z;a5(:,9)];
mechs=[mechs;a5(:,3:8)];
year=[year;a5(:,10)];

isCMT=0*Lon;isCMT(end-length(a3)-length(a4)-length(a5)+1:end)=1;




slabxsec=[35 63
    200 68
    200 54
    25 54 
%     0 59
    25 59
    35 63];
    
inslab=find(Lon<-141.5 & Lon>-152 & inpolygon(z,Lat,slabxsec(:,1),slabxsec(:,2)) | z>40);
slabpoly=[-158 54
    -144 58.75
    -142.75 59.25
    -140 60
    -138 58.5
    -136 56
    ];
    
inslab0=find(inpolygon(Lon,Lat,slabpoly(:,1),slabpoly(:,2)));
inslab=[inslab;inslab0];
z(z<0)=0;

% figure;plot3(Lon(z<=15),Lat(z<=15),-z(z<=15),'ko','markerfacecolor','k','markersize',3);grid on;hold on;
% g=0.4*[1 1 1];b=find(z<=20 & z>15);plot3(Lon(b),Lat(b),-z(b),'o','markerfacecolor',g,'markeredgecolor',g,'markersize',3);grid on
% g=0.5*[1 1 1];b=find(z<=25 & z>20);plot3(Lon(b),Lat(b),-z(b),'o','markerfacecolor',g,'markeredgecolor',g,'markersize',3);grid on
% g=0.6*[1 1 1];b=find(z<=30 & z>25);plot3(Lon(b),Lat(b),-z(b),'o','markerfacecolor',g,'markeredgecolor',g,'markersize',3);grid on
% g=0.7*[1 1 1];b=find(z<=35 & z>30);plot3(Lon(b),Lat(b),-z(b),'o','markerfacecolor',g,'markeredgecolor',g,'markersize',3);grid on
% g=0.7*[1 1 1];b=find(z<=40 & z>35);plot3(Lon(b),Lat(b),-z(b),'o','markerfacecolor',g,'markeredgecolor',g,'markersize',3);grid on
% g=0.9*[1 1 1];b=find(z>=40 );plot3(Lon(b),Lat(b),-z(b),'o','markerfacecolor',g,'markeredgecolor',g,'markersize',3);grid on
% 
% % axis tight
% % ylim([min(Lat) max(Lat)])
% view(83, 0)
% % hold on;plot3(ocean(:,1),ocean(:,2),0*ocean(:,2),'b')
% hold on;plot3(slabxsec(:,1)*0-147,slabxsec(:,2),-slabxsec(:,1),'b')
% % hold on;plot3(Lon(Lon>-141.5),Lat(Lon>-141.5),-z(Lon>-141.5),'co','markerfacecolor','c');grid on
% hold on;plot3(Lon(inslab),Lat(inslab),-z(inslab),'o','markerfacecolor',[0.5 0.5 0.5],'markeredgecolor',[0.5 0.5 0.5],'markersize',3);grid on
% 
% % zlim([-200 0])
% % okay=find(z<20 & inpolygon(z,Lat,slabxsec(:,1),slabxsec(:,2) ) & 
% 
topslab=[find(Lon <-145.5 & Lon>-151.5 & Lat<63 & z>40 );
find(Lon <-145.5 & Lon>-151.5 & Lat<62 & z>37.5 );
find(Lon <-145.5 & Lon>-151 & Lat<61.75 & z>33.5 );
find(Lon <-145.5 & Lon>-150.6 & Lat<61.5 & z>29.5 );
find(Lon <-145.5 & Lon>-150.2 & Lat<61.25 & z>25 );
find(Lon <-145.5 & Lon>-149.8 & Lat<61 & z>22.5 );
find(Lon <-145.5 & Lon>-149.4 & Lat<60.75 & z>21.25 );
find(Lon <-145.5 & Lon>-149 & Lat<60.5 & z>20 )];
topslab=unique(topslab);
% topslab=topslab(~ismember(topslab,inslab));
% hold on;plot3(Lon(topslab),Lat(topslab),-z(topslab),'mo','markerfacecolor','m','markersize',3);grid on

westslab=find(Lon <-151.5 & Lon>-160 & Lat<60 & z>23 );

oceanic_crust=[find(Lat<59.5 & Lon>-147 & Lon<-143);
find(Lat<59 & Lon>-152.1 & Lon<-150)];
oceanic_crust=unique(oceanic_crust);

 load Mann25km.txt
Mann25km=[Mann25km;
    -139 47
    Mann25km(1,1) 47
    Mann25km(1,:)];
Mann=find(inpolygon(Lon,Lat,Mann25km(:,1),Mann25km(:,2)) & z>=20);
Mann10km=Mann25km;Mann10km(:,2)=Mann10km(:,2)-1;
Mann2=find(inpolygon(Lon,Lat,Mann10km(:,1),Mann10km(:,2)) & z>=10);

trench=[-158 54
-149 58.5
-145 59.7
-137 57
-137 47
-158 47
-158 54];
pasttrench=find(inpolygon(Lon,Lat,trench(:,1),trench(:,2)) );

% westslab=westslab(~ismember(westslab,inslab));
% 
% z(topslab)=999;
% z(westslab)=999;
% z(inslab)=999;
% 
% plot3(Lon(inslab),Lat(inslab),-z(inslab),'m.','markersize',20)
% plot3(Lon(westslab),Lat(westslab),-z(westslab),'c.')
% 
% plot3(Lon(topslab),Lat(topslab),-z(topslab),'b.')
% xlim([-147.05 -146.2])
% ylim([61 61.9])
% zlim([-60 0])
% 




within=find( z<40 );
within=within(~ismember(within,topslab));
within=within(~ismember(within,westslab));
within=within(~ismember(within,inslab));
within=within(~ismember(within,oceanic_crust));
within=within(~ismember(within,Mann));
within=within(~ismember(within,Mann2));
within=within(~ismember(within,pasttrench));
Lon=Lon(within);Lat=Lat(within);z=z(within);mechs=mechs(within,:);year=year(within);isCMT=isCMT(within);
a=find(year<=2008 & isCMT==0);dlmwrite('locs2008.txt',[Lon(a) Lat(a)],'\t');
a=find(year>2008 & isCMT==0);dlmwrite('locs2023.txt',[Lon(a) Lat(a)],'\t');
a=find(isCMT==1);dlmwrite('locsCMT.txt',[Lon(a) Lat(a)],'\t');
 figure(998);plot(Lon,Lat,'ko');hold on;
 a=find(z>20);plot(Lon(a),Lat(a),'yo','markerfacecolor','y')
%  load Mann25km.txt
 plotpt(Mann25km,'m')
 plotpt(Mann10km,'y')
 plotpt(trench,'b')
 
 figure(997);plot3(Lon,Lat,-z,'ko');hold on;grid on
 a=find(z>20);plot3(Lon(a),Lat(a),0*z(a),'yo','markerfacecolor','y')
 a=find(z>20);plot3(Lon(a),Lat(a),-z(a),'yo','markerfacecolor','y')
 a=find(z<=20 &z>10);plot3(Lon(a),Lat(a),-z(a),'go','markerfacecolor','g')
%  a=find(z>20 & type<=1);plot3(Lon(a),Lat(a),-z(a),'ro','markerfacecolor','r')
 
 
 plotpt(ocean,'b')
