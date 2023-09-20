cc
tic
siteLat=31.064;siteLon=-8.391;
a=load('MoroccoCMT2.txt');name='Oukaimedene';
% dlmwrite('moroccocmt2.csv',a(:,[1 2 3 11 4:9]),'\t')
% foo=find( a(:,1)>=22);a(foo,:)=NaN;
% Lon=a(:,2);Lat=a(:,3);mechs=a(:,4:6);ID=a(:,1);focaldepth=a(:,11);

% foo=find( a(:,2)>-5.75 );
foo=find( a(:,1)>=22 );
a(foo,:)=NaN;
okay=find(~isnan(a(:,2)));a=a(okay,:);

Lon=a(:,2);Lat=a(:,3);mechs=a(:,4:6);ID=a(:,1);focaldepth=a(:,11);

mainshock=find(Lon==-8.391);

[t,p,b,Ptr,Ppl,Ttr,Tpl,Ntr,Npl]=sdr2tpb_positivePlunge(mechs(:,1),mechs(:,2),mechs(:,3));
 [type,SH]=classifyFocalMechanisms(Ptr,Ppl,Ttr,Tpl,Ntr,Npl); 
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
%  dlmwrite('MoroccoPaxes',[Lon(type~=0) Lat(type~=0) type(type~=0) SH(type~=0) 0*SH(type~=0)+1],'\t')

 
  SDR=mechs(:,1:3);%
%   foo=find(SDR(:,3)==90);SDR(foo,3)=89;
dx=((Lon-siteLon).*cosd(Lat/2+siteLat/2));dy=Lat-siteLat;
 D=sqrt(dx.^2 +dy.^2);D0=D;D(D<1)=1;
%  D=exp(-D.^2/(2*0.675).^2);D=1./D;
% w=1./D;w=w/sum(w);figure;plot(D0,w,'ko')
%  q=quantile(D,3/length(D));D(D<q)=q;
% D=0*Lon+1;
maindepth=5; dPp=0;Svgrad=-26.5;Svspread=2;PpGrad=9.813;friction_mean=0.6;friction_spread=0.6;
num_realizations=1001;dPp=dPp+(rand(num_realizations,1)-0.5)*0;plot_file='Oukaimedene';
z=maindepth*ones(num_realizations,1);Pp=-PpGrad.*z+dPp;Svg=Svgrad+(rand(num_realizations,1)-0.5)*Svspread; Sv=Svg.*z;fric=friction_mean+(rand(num_realizations,1)-0.5)*friction_spread;  


[tau_all,SHMAX_all,STYLE,shape_ratio_statistics,sigma_vector_1_statistics,sigma_vector_2_statistics,sigma_vector_3_statistics]=StressInversions(SDR,fric,D,num_realizations);
aphi=(STYLE+0.5)+(-1).^STYLE.*(shape_ratio_statistics-0.5);
A_phi=median(aphi);A_phi_low=quantile(aphi,0.16);A_phi_high=quantile(aphi,0.84);A_phi_low2=quantile(aphi,0.05);A_phi_high2=quantile(aphi,0.95);Aphi_uncert=(A_phi_high2-A_phi_low2)/4;
SHMAX_all=SHmod180(SHMAX_all);SHmax_max=quantile(SHMAX_all,0.84);SHmax_min=quantile(SHMAX_all,0.16);SHmax_max2=quantile(SHMAX_all,0.95);SHmax_min2=quantile(SHMAX_all,0.05);SH_uncert=(SHmax_max-SHmax_min)/2;
strike1=SDR(:,3);
StressStereonet2_smaller; %addWSMtoStereo

% set(gcf,'position',[439 450 434 416])
% saveas(gcf,'OukaimedeneFewWweightedVeryLowmu','png');

dip_=[1:3:25 27:2:55 56:1:90];strike_=0:1:360;[dip_,strike_]=mesh_replace(dip_,strike_);
dP_all=zeros(length(strike_),num_realizations);
Ts_all=zeros(length(strike_),num_realizations);
Sn_all=zeros(length(strike_),num_realizations);
CFS=zeros(length(strike_),num_realizations);
S1s=zeros(num_realizations,1);S2s=zeros(num_realizations,1);S3s=zeros(num_realizations,1);
for i=1:num_realizations
    [dP,S_normal,T_shear,S1_,S2_,S3_,CFS_]=FSP(tau_all(:,:,i),aphi(i),fric(i),Pp(i),Sv(i),strike_,dip_);
    dP_all(:,i)=dP-min(dP);Sn_all(:,i)=S_normal;Ts_all(:,i)=T_shear;
    S1s(i)=S1_;S2s(i)=S2_;S3s(i)=S3_;CFS(:,i)=CFS_;
end
mean_dP=quantile(dP_all',0.05)';
%%
    CFSStereo(dip_,strike_,mean_dP, mean(Pp-S3s))
     
    %%
    tau=mean(tau_all,3);tau=tau/norm(tau);
%      [d1,d2,d3] = azimuth_plunge(tau)
     [a,b,c,d,e,f]=aux_planes(SDR(:,1),SDR(:,2),SDR(:,3));

    defmisfits=misfits_for_this_tensor(d,e,f,tau);
    abcmisfits=misfits_for_this_tensor(a,b,c,tau);

        CFSinterp=scatteredInterpolant(strike_,dip_,mean_dP,'natural','nearest');
        CFS_ab=CFSinterp(a,b);
        CFS_de=CFSinterp(d,e);
        
       
 cab=CFS_ab-2.5;cab(cab<0)=0;
 cde=CFS_de-2.5;cde(cde<0)=0;
 
 mabc=abcmisfits-7.5;mabc(mabc<0)=0;
 mdef=defmisfits-7.5;mdef(mdef<0)=0;
 
       objabc=cab;
        objdef=cde;
        obj=min([objabc objdef]')';
        
  
        misfit_final=abcmisfits;
        misfit_aux=defmisfits;
        CFS_final=CFS_ab;CFS_aux=CFS_de;
         foo=find(objdef<objabc);at=a;bt=b;ct=c;dt=d;et=e;ft=f;
         a(foo)=dt(foo);b(foo)=et(foo);c(foo)=ft(foo);
         d(foo)=at(foo);e(foo)=bt(foo);f(foo)=ct(foo);
         CFS_final(foo)=CFS_de(foo);
         CFS_aux(foo)=CFS_ab(foo);
         misfit_final(foo)=defmisfits(foo);
         misfit_aux(foo)=abcmisfits(foo);
        
         
         
  tau = linear_stress_inversion_DistWeighted(a,b,c,D');
          defmisfits=misfits_for_this_tensor(d,e,f,tau);
    abcmisfits=misfits_for_this_tensor(a,b,c,tau);
  CFS_ab=CFSinterp(a,b);
        CFS_de=CFSinterp(d,e);
        
       
 cab=CFS_ab-2.5;cab(cab<0)=0;
 cde=CFS_de-2.5;cde(cde<0)=0;
 
 mabc=abcmisfits-7.5;mabc(mabc<0)=0;
 mdef=defmisfits-7.5;mdef(mdef<0)=0;
 
       objabc=cab;
        objdef=cde;
        obj=min([objabc objdef]')';
        
  
        misfit_final=abcmisfits;
        misfit_aux=defmisfits;
        CFS_final=CFS_ab;CFS_aux=CFS_de;
         foo=find(objdef<objabc);at=a;bt=b;ct=c;dt=d;et=e;ft=f;
         a(foo)=dt(foo);b(foo)=et(foo);c(foo)=ft(foo);
         d(foo)=at(foo);e(foo)=bt(foo);f(foo)=ct(foo);
         CFS_final(foo)=CFS_de(foo);
         CFS_aux(foo)=CFS_ab(foo);
         misfit_final(foo)=defmisfits(foo);
         misfit_aux(foo)=abcmisfits(foo);
        
invstats=[round(A_phi*100)/100 round(Aphi_uncert*100)/100 round(median(SHMAX_all)) round(SH_uncert) ...
     round(mean(misfit_final*10))/10 round(mean(CFS_final*10))/10 ...
    round(misfit_final(mainshock)*10)/10 round(CFS_final(mainshock)*10)/10 ...
    round(misfit_aux(mainshock)*10)/10 round(CFS_aux(mainshock)*10)/10 ]
         
         
        
mainshock=find(Lon==-8.391);

graycolor=[0.6 0.6 0.6];
radii = sqrt(2)*sin(e*pi/360);
s2=90-d;x=cosd(s2).*radii;y=sind(s2).*radii;
plot(x,y,'o','color',graycolor,'MarkerFaceColor',graycolor)
        plot(x(mainshock),y(mainshock),'o','color',graycolor,'markersize',20,'MarkerFaceColor',graycolor)


radii = sqrt(2)*sin(b*pi/360);
s2=90-a;x=cosd(s2).*radii;y=sind(s2).*radii;
plot(x,y,'ko','MarkerFaceColor','k')

        plot(x(mainshock),y(mainshock),'ko','MarkerFaceColor','k','markersize',20)
% saveas(gcf,'OukaimedeneFSPFewWweightedVeryLowmu','png');

toc
%%

function CFSStereo(dip_,strike_,mean_dP,hydrofrac)
radii = sqrt(2)*sin(dip_*pi/360);
s2=90-strike_;x=cosd(s2).*radii;y=sind(s2).*radii;
F=scatteredInterpolant(x,y,mean_dP,'linear','nearest');
    xx=[-1.01 -1.008 -1.006 -1.004 -1.002 -1.001 -1 -0.99:0.01:0.99 1 1.001 1.002 1.004 1.006 1.008 1.01];yy=xx;
    [xx,yy]=meshgrid(xx,yy);
    ddPP=F(xx,yy);outside=find( (xx.^2 + yy.^2)>1);ddPP(outside)=NaN;
    
    

figure;  hold on
    Stereo2
    contour(xx,yy,ddPP,linspace(0,max(mean_dP),500),'Fill','On');colormap(flipud(stoplightSparta))
    c=colorbar('position',[0.85 0.2 0.02 0.64],'Direction','reverse','FontSize',16);
    c.Label.String='MPa';
    c.Label.FontSize=20;
    c.Label.Position=[0.5 -3 0];
    c.Label.Rotation=0;
    c.Label.FontWeight='Bold';
%     cmax=quantile(ddPP(~isnan(ddPP)),0.4);
    caxis([0 25])
    axis equal
    Stereo2
    strikecolor=[0.5 0.5 0.5];
    text(0,1.08,'Strike','HorizontalAlignment','center','FontWeight','Bold','Fontsize',24,'color',strikecolor)
    text(0,0.95,'000','HorizontalAlignment','center','FontWeight','Bold' ,'Fontsize',20,'color',strikecolor)
    text(0,-0.95,'180','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20,'color',strikecolor)
    text(0.88,0,'090','HorizontalAlignment','left','FontWeight','Bold','Fontsize',20,'color',strikecolor)
    text(-0.88,0,'270','HorizontalAlignment','right','FontWeight','Bold','Fontsize',20,'color',strikecolor)
    text(0,0,'Dip','rotation',60,'HorizontalAlignment','center','FontWeight','Bold','Fontsize',24)    
    text(0.7*sin(30*pi/360.),1.25*sin(30*pi/360.),'30°','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20)
    text(0.7*sin(60*pi/360.),1.25*sin(60*pi/360.),'60°','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20)
    text(0.7*sin(90*pi/360.),1.25*sin(90*pi/360.),'90°','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20)
%     contour(xx,yy,ddPP,[1 1],'k','linewidth',2) 
    contour(xx,yy,ddPP,[2 2],'k','linewidth',2) 
    contour(xx,yy,ddPP,[5 5],'k','linewidth',1) 
%     contour(xx,yy,ddPP,[8.28 8.28],'k','linewidth',0.5) 
    contour(xx,yy,ddPP,[hydrofrac hydrofrac],'k--','linewidth',1) 
    
end