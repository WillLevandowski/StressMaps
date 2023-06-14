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
 
% makePorTorNaxesStereo(Ptr,Ppl);title('P axes')
%   foo=find(Lat<62 & type==0.5 & ( (SH>55 & SH<145) | (SH>235 & SH<325)));
% type(foo)=-999;
% okay=find(type>=0 );
% 
% SH=SH(okay);
% Lon=Lon(okay);
% Lat=Lat(okay);
% mechs=mechs(okay,:);
% Ptr=Ptr(okay);
% Ttr=Ttr(okay);
% Ntr=Ntr(okay);
% Ppl=Ppl(okay);
% Tpl=Tpl(okay);
% Npl=Npl(okay);
% within=within(okay);
% z=z(okay);
% type=type(okay);


okay=find(type==1.5 & mechs(:,3)<0 & mechs(:,6)<0);type(okay)=1.45;
okay=find(type==1.5 & mechs(:,3)>0 & mechs(:,6)>0);type(okay)=1.55;



clear okay foo inslab a b ocean p s1 s2 slabxsec t i ans
% 
%  
 SH=mod(SH,180);
 for iters=1:3
 SHmed=median(SH);
  SH(SH<SHmed-90)=SH(SH<SHmed-90)+180;
SHmed=median(SH);
 SH(SH>SHmed+90)=SH(SH>SHmed+90)-180;
 end
  
 SH_=mod(SH,180);
 dx=NaN+SH;
 NE=find(SH_>=0 & SH_<90);
 dx(NE)=sind(SH_(NE));
 dy(NE)=cosd(SH_(NE));
 SE=find(SH_>=90 & SH_<180);
 dx(SE)=sind(SH_(SE));
 dy(SE)=cosd(SH_(SE));
 
dx=dx./cosd(Lat);
dx=dx/5;
dy=dy/5;
%%% az 0 dy 1 dx 0
 %%% az 30 dy sqrt(3)/2 dx 1/2
 %%% az 45 dy sqrt(2)/2 dx sqrt(2)/2
 %%% az 120 dy -1/2 dx sqrt(3)/2
 %%% az 135 dy -sqrt(2)/2 dx sqrt(2)/2
 
 if toplot
 figure;%plot(Lon,Lat,'k.');
 hold on
%  plot(OsageAOI(:,1),OsageAOI(:,2),'k','linewidth',3)

%  set_colors
 for i=1:length(Lon)
   
      if type(i)==0.5
            plot3(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,[-z(i) -z(i)],'color',[1 0 0],'linewidth',2);
      end
       if type(i)==1
            plot3(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,[-z(i) -z(i)],'color',[1 0.5 0],'linewidth',2);
       end
%        if type(i)==1.25
%             plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[0.6 0.5 0.5],'linewidth',2);
%        end
%        if type(i)==1.35
%             plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[0.6 0.5 0.5],'linewidth',2);
%       end
       if type(i)==1.45
            plot3(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,[-z(i) -z(i)],'color',[0.7 0.5 0.3],'linewidth',2);
       end
        if type(i)==1.5
            plot3(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,[-z(i) -z(i)],'color',[0.5 0.5 0.5],'linewidth',2);
        end
        if type(i)==1.55
            plot3(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,[-z(i) -z(i)],'color',[0.4 0.6 0.6],'linewidth',2);
       end
%        if type(i)==1.65
%             plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[0.5 0.5 0.6],'linewidth',2);
%        end
%        if type(i)==1.75
%             plot(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,'color',[0.5 0.5 0.6],'linewidth',2);
%       end
      if type(i)==2
            plot3(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,[-z(i) -z(i)],'color',[0 1 1],'linewidth',2);
      end
      if type(i)==2.5
            plot3(Lon(i)+[-dx(i) dx(i)]/2,Lat(i)+[-dy(i) dy(i)]/2,[-z(i) -z(i)],'color',[0 0 1],'linewidth',2);
      end
 end
 grid on
% ylim([60 64])
% xlim([-150-2*2.22 -150+2*2.22])
%%
% for loops=1:20
% for i=1:55
% z1=(-i)-2.5;
% z2=(-i)+2.5;
%     zlim([z1 z2])
%  title([num2str(-z2) ' to ' num2str(-z1)])
% pause(0.25)
% end
% end
%%


 if subregion==1
 dlmwrite('All_AKPaxes',[Lon(type~=0) Lat(type~=0) type(type~=0) SH(type~=0) 0*SH(type~=0)+0.3],'\t')
 end
 
%  plot(siteLon,siteLat,'yo','markersize',20)
%   plot(Lon,Lat,'g.')

%  for i=1:length(Lon)
%                  plot(Lon(i)+[-dx(i) dx(i)]/5,Lat(i)+[-dy(i) dy(i)]/5,'g','linewidth',1);
%  end

%  axis equal
grid on

 pbaspect([1 0.4 1])
%  
%  SH(SH<60)=SH(SH<60)+180;
% figure;plot(type,SH,'ko');
%  figure;hist(SH,100)
clear a*
set(gcf,'Position', [1 2 1035 864])

% plotpt(FranklinMtnsPoly,'m')
% plotpt(PhilSmithPoly,'b')
% plotpt(PorcupinePlateauPoly,'k')
% plotpt(OgilvieMtnsPoly,'b')
% plotpt(MackenziePoly,'k')
% plotpt(SewardPoly,'k')
% plotpt(KobukPoly,'m')
% plotpt(NowitnaPoly,'k')
% plotpt(MintoPoly,'g')
% plotpt(TananaPoly,'m')
% plotpt(StEliasPoly,'g')
% plotpt(WestStEliasPoly,'m')
% plotpt(YakutatPoly,'k')
% plotpt(NorthernFoothillsPoly,'k')
% plotpt(DenaliPoly,'g')
% plotpt(SusitnaPoly,'m')
% plotpt(SWAKPoly,'k--')

 end

 