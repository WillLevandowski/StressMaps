cc
a=load('CMT_180lon160_47lat72_0z20.txt');
b=load('CMTz_180lon160_47lat72_0z20.txt');

% dat=a(:,1:6);
% dat=[dat b(:,3)];

year=mod(a(:,end),100);
year(year>76)=year(year>76)+1900;
year(year<76)=year(year<76)+2000;
 recent=find(a(:,end)>10^8);
year(recent)=floor(a(recent,end)/10^8);   
dat=a(:,1:8);
dat=[dat b(:,3) year];

trenchpoly=[-180 50.5 
    -176.4 50.95
    -173 51.3
    -166.5 52.4
    -163 53
   
    -160 53.7
    -157.5 55.2
    -155 55.25
    -155 40
    -180 40
    -180 50.5];
okay=find(~inpolygon(dat(:,1),dat(:,2),trenchpoly(:,1),trenchpoly(:,2)));
dat=dat(okay,:);
    
okay=find(dat(:,2)>66.5 | dat(:,2)<66 | dat(:,1)<-158 | dat(:,1)>-156.4);
dat=dat(okay,:);


dlmwrite('CMT_westAlaska.txt',dat,'\t')