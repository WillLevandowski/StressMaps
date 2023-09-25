
[t,p,b,Ptr,Ppl,Ttr,Tpl,Ntr,Npl]=sdr2tpb_positivePlunge(mechs(:,1),mechs(:,2),mechs(:,3));
 [type,SH]=classifyFocalMechanisms(Ptr,Ppl,Ttr,Tpl,Ntr,Npl,mechs); 
 
 for i=1:length(type)
     if type(i)==0
         if Npl(i)>Ppl(i) && Npl(i)>Tpl(i)
             type(i)=1.5;
             s1=Ptr(i);
             s2=Ttr(i)+90;if s2>Ptr(i)+180;s2=s2-180;end
                            if s2<Ptr(i)-180;s2=s2+180;end
             SH(i)=s1/2+s2/2;
         else
             if Ppl(i)>Npl(i) && Ppl(i)>=Tpl(i) 
                 SH(i)=Ntr(i)+90;
                 type(i)=1.5;
                 if mechs(i,3)<0 && mechs(i,6)<0
                     type(i)=1;
                 end
                 if mechs(i,3)<-60 && mechs(i,3)>-120 && mechs(i,6)<-60 && mechs(i,6)>-120
                     type(i)=0.5;
                 end
             end
             if Tpl(i)>Ppl(i) && Tpl(i)>Npl(i)
                 type(i)=2;
                 s1=Ptr(i);s2=Ntr(i)+90;if s2>Ptr(i)+180;s2=s2-180;end
                                        if s2<Ptr(i)-180;s2=s2+180;end
                 SH(i)=s1/2+s2/2;
             end
         end
     end
 end


for iters=1:3;SHmed=median(SH);SH(SH<SHmed-90)=SH(SH<SHmed-90)+180;SHmed=median(SH); SH(SH>SHmed+90)=SH(SH>SHmed+90)-180; end
  
 SH_=mod(SH,180);
 dx=NaN+SH;
 NE=find(SH_>=0 & SH_<90);
 dx(NE)=sind(SH_(NE));
 dy(NE)=cosd(SH_(NE));
 SE=find(SH_>=90 & SH_<180);
 dx(SE)=sind(SH_(SE));
 dy(SE)=cosd(SH_(SE));
 dx=dx/5;
dy=dy/5;
%%% az 0 dy 1 dx 0
 %%% az 30 dy sqrt(3)/2 dx 1/2
 %%% az 45 dy sqrt(2)/2 dx sqrt(2)/2
 %%% az 120 dy -1/2 dx sqrt(3)/2
 %%% az 135 dy -sqrt(2)/2 dx sqrt(2)/2
 
 figure;
 hold on

 for i=1:length(Lon)
   
      if type(i)==0.5
            plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[1 0 0],'linewidth',2);
      end
       if type(i)==1
            plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[1 0.5 0],'linewidth',2);
       end
     
        if type(i)==1.5
            plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[0.65 0.65 0.65],'linewidth',3);
        end
       
      if type(i)==2
            plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[0 1 1],'linewidth',2);
      end
      if type(i)==2.5
            plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[0 0 1],'linewidth',2);
      end
 end
 grid on

text(min(Lon)+range(Lon/50),min(Lat)+range(Lat/100),'Normal','color','r')
text(min(Lon)+range(Lon/50),min(Lat)+3*range(Lat/100),'Oblique-normal','color',[1 0.5 0])
text(min(Lon)+range(Lon/50),min(Lat)+5*range(Lat/100),'Strike-slip','color',[0.65 0.65 0.65])
text(min(Lon)+range(Lon/50),min(Lat)+7*range(Lat/100),'Reverse-oblique','color',[0 1 1])
text(min(Lon)+range(Lon/50),min(Lat)+9*range(Lat/100),'Reverse','color',[0 0 1])
lonplot=Lon;lonplot(lonplot<-180)=lonplot(lonplot<-180)+360;
grid on
axis equal
clear a*
set(gcf,'Position', [1 2 1035 864])


 
