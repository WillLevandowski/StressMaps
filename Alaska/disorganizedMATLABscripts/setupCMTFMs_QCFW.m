cc
a=load('CMT_140lon130_47lat58_0z20.txt');
b=load('CMTz_140lon130_47lat58_0z20.txt');

% dat=a(:,1:6);
% dat=[dat b(:,3)];

year=mod(a(:,end),100);
year(year>76)=year(year>76)+1900;
year(year<76)=year(year<76)+2000;
    recent=find(a(:,end)>10^8);
year(recent)=floor(a(recent,end)/10^8);

dat=a(:,1:8);
dat=[dat b(:,3) year];

trenchpoly=[-133 53
    -131.9 52.425
    -131.9 40
    -133 40
    -133 53];
   
okay=find(~inpolygon(dat(:,1),dat(:,2),trenchpoly(:,1),trenchpoly(:,2)));
dat=dat(okay,:);
%     
% okay=find(dat(:,2)>66.5 | dat(:,2)<66 | dat(:,1)<-158 | dat(:,1)>-156.4);
% dat=dat(okay,:);
% 
% 
dlmwrite('CMT_eastAlaska.txt',dat,'\t')
% 


