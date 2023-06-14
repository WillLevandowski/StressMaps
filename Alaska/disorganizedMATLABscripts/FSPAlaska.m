
dip_=[0:2:50 51:1:90];strike_=0:2:360;
nr=num_realizations;
dP_all=zeros(length(dip_)*length(strike_),nr);
ShearProp_all=zeros(length(dip_)*length(strike_),nr);
[dip_,strike_]=mesh_replace(dip_,strike_);S_normal=zeros(length(strike_),1);Ts_mag=zeros(length(strike_),1);
for i=1:nr
    friction=friction_mean;gamma=( sqrt(friction^2+1) +friction)^2;
%     tau=tau_all(:,:,i);
    e=eig(tau);phi=(e(2)-e(3))/(e(1)-e(3));
     z=maindepth;Pp=-9.8; Sv=-25;Sv=Sv*z;Pp=Pp*z+dPp;

     
    if aphi(i)>=1 && aphi(i)<=2 % (tau(3,3)>=tau(2,2) && tau(3,3)<=tau(1,1)) || (tau(3,3)<=tau(2,2) && tau(3,3)>=tau(1,1))
        S3= (Sv/phi - Pp + gamma*Pp) / (1/phi -1 + gamma);S1=(Sv-S3)/phi + S3;S2=Sv;
    end
    if aphi(i)<1 %tau(3,3)<=tau(2,2) && tau(3,3)<=tau(1,1)
        S1=Sv;S3=Pp+(S1-Pp)/gamma;S2=(1-phi)*S3+phi*S1; 
    end
    if aphi(i)>2 %tau(3,3)>=tau(2,2) && tau(3,3)>=tau(1,1)
        S3=Sv;S1=Pp+gamma*(S3-Pp);S2=(1-phi)*S3+phi*S1; 
    end
    D=S1-S3;diag=(S1+S2+S3)/3;[v,d]=eig(tau);dd=d(3,3)-d(1,1);t=tau*-D/dd;
    t(1,1)=t(1,1)+diag;t(2,2)=t(2,2)+diag;t (3,3)=t(3,3)+diag;
    
    
    for i_mechanism=1:length(strike_)
        strike=strike_(i_mechanism);dip=dip_(i_mechanism);
        n1 = -sin(dip*pi/180).*sin(strike*pi/180);n2 =  sin(dip*pi/180).*cos(strike*pi/180);n3 = -cos(dip*pi/180);N=[n1;n2;n3;];
        T=-t*N; T_mag = sqrt(sum(T.^2));
        S_normal(i_mechanism,1) = dot(T,N);
        B = cross(T,N); Ts = cross(N,B); Ts_mag(i_mechanism,1) = sqrt(Ts(1)^2 + Ts(2)^2 + Ts(3)^2);
    end
    S_n=S_normal;Shear_crit=friction*(S_n+Pp);dShear=Shear_crit-Ts_mag;
    S_normal=S_normal+Pp-dPp; %%%% effective normal if at hydrostatic
    CFS=friction*S_normal-Ts_mag;
    critP=-(S_n-Ts_mag/friction);%S_n*friction;
    dP=Pp-critP;
    dP_all(:,i)=dP-min(dP);
    ShearProp=100*Ts_mag./Shear_crit;
    ShearProp_all(:,i)=ShearProp;
 
end
toc


mean_dP=quantile(dP_all',0.05)';mean_ShearProp=mean(ShearProp_all,2);max_ShearProp=quantile(ShearProp_all',0.95)';
dPore=quantile(dP_all',0.5)';
dPore3=quantile(dP_all',0.9)';
if nr==1;mean_dP=dP;dPore=dP_all;mean_ShearProp=ShearProp_all;max_ShearProp=ShearProp_all;end
%%
radii = sqrt(2)*sin(dip_*pi/360);
s2=90-strike_;x=cosd(s2).*radii;y=sind(s2).*radii;
F=scatteredInterpolant(x,y,mean_dP,'linear','nearest');
    xx=[-1.01 -1.008 -1.006 -1.004 -1.002 -1.001 -1 -0.99:0.01:0.99 1 1.001 1.002 1.004 1.006 1.008 1.01];yy=xx;
    [xx,yy]=meshgrid(xx,yy);
    ddPP=F(xx,yy);outside=find( (xx.^2 + yy.^2)>1);ddPP(outside)=NaN;
    

  figure;  hold on
%    cd  ../
    Stereo2
%     cd Alaska
    contour(xx,yy,ddPP,linspace(0,max(mean_dP),500),'Fill','On');colormap(flipud(stoplightSparta))
    c=colorbar('position',[0.85 0.2 0.02 0.64],'Direction','reverse','FontSize',16);
    c.Label.String='MPa';
    c.Label.FontSize=20;
    c.Label.Position=[0.5 -3 0];
    c.Label.Rotation=0;
    c.Label.FontWeight='Bold';
%     cmax=quantile(ddPP(~isnan(ddPP)),0.4);
    caxis([0 26])
    axis equal
    Stereo2
    strikecolor=[0.35 0.35 0.35];
%     text(0,1.18,['dCFS, ' num2str(maindepth) ' km depth - 90% confidence'],'HorizontalAlignment','center','FontWeight','Bold','fontsize',16)
    text(0,1.18,[name ' Coulomb Failure Stress'],'HorizontalAlignment','center','FontWeight','Bold','fontsize',20)

    %     text(0,1.18,'Deterministic \DeltaP, 5 km depth','HorizontalAlignment','center','FontWeight','Bold','fontsize',16)
    text(0,1.08,'Strike','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20,'color',strikecolor)
    text(0,0.95,'000','HorizontalAlignment','center','FontWeight','Bold' ,'Fontsize',20,'color',strikecolor)
    text(0,-0.95,'180','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20,'color',strikecolor)
    text(0.88,0,'090','HorizontalAlignment','left','FontWeight','Bold','Fontsize',20,'color',strikecolor)
    text(-0.88,0,'270','HorizontalAlignment','right','FontWeight','Bold','Fontsize',20,'color',strikecolor)
    text(0,0,'Dip','rotation',60,'HorizontalAlignment','center','FontWeight','Bold','Fontsize',24)
%     text(0,0,'Dip0°','HorizontalAlignment','center','FontWeight','Bold','Fontsize',24)
    
    text(0.7*sin(30*pi/360.),1.25*sin(30*pi/360.),'30°','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20)
    text(0.7*sin(60*pi/360.),1.25*sin(60*pi/360.),'60°','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20)
    text(0.7*sin(90*pi/360.),1.25*sin(90*pi/360.),'90°','HorizontalAlignment','center','FontWeight','Bold','Fontsize',20)
     contour(xx,yy,ddPP,[2 2],'k','linewidth',2) 
    contour(xx,yy,ddPP,[5 5],'k','linewidth',1) 
    contour(xx,yy,ddPP,[15 15],'k--','linewidth',1) 
    
%     
% 
% 
% radii = sqrt(2)*sin(dip_*pi/360);
% s2=90-strike_;x=cosd(s2).*radii;y=sind(s2).*radii;
%     F=scatteredInterpolant(x,y,mean_dP,'linear','none');
%     F2=scatteredInterpolant(x,y,dPore,'linear','none');
%     F3=scatteredInterpolant(x,y,dPore3,'linear','none');
%     xx=-1.1:0.01:1.1;yy=xx;[xx,yy]=meshgrid(xx,yy);ddPP=F(xx,yy);ddPore=F2(xx,yy);ddPore3=F3(xx,yy);
%     hydrofrac=Pp-S3;ddPore(ddPore>hydrofrac)=Inf; 
%     figure;  hold on;Stereo
%     contour(xx,yy,ddPP,linspace(0,max(mean_dP),500),'Fill','On');colormap(flipud(stoplightSparta))
%     colorbar('position',[0.87 0.2 0.02 0.64],'Direction','reverse')
%     caxis([0 hydrofrac])
%     axis equal
%     Stereo
%     text(0,1.18,[name ' Coulomb Failure Stress, MPa'],'HorizontalAlignment','center','FontWeight','Bold','fontsize',20)
%     text(0,1.05,'Strike N0E','HorizontalAlignment','center','FontWeight','Bold')
%     text(0,-1.05,'N180E','HorizontalAlignment','center','FontWeight','Bold')
%     text(1,0,'N90E','HorizontalAlignment','left','FontWeight','Bold')
%     text(-1,0,'N270E','HorizontalAlignment','right','FontWeight','Bold')
%     text(0,0,'Dip=0','HorizontalAlignment','center','FontWeight','Bold')
%     text(0.7*sin(30*pi/360.),1.25*sin(30*pi/360.),'30','HorizontalAlignment','center','FontWeight','Bold')
%     text(0.7*sin(60*pi/360.),1.25*sin(60*pi/360.),'60','HorizontalAlignment','center','FontWeight','Bold')
%     text(0.7*sin(90*pi/360.),1.25*sin(90*pi/360.),'90','HorizontalAlignment','center','FontWeight','Bold')
%     contour(xx,yy,ddPP,[hydrofrac hydrofrac],'color',[0.6 0.6 0.6],'linewidth',3)
%     contour(xx,yy,ddPP,[2 2],'k-','linewidth',2)
%     contour(xx,yy,ddPP,[5 5],'k-','linewidth',1)
%     contour(xx,yy,ddPP,[15 15],'k--','linewidth',1)
%     foo=0;
% %     contour(xx,yy,ddPore,[hydrofrac hydrofrac],'b--','linewidth',2)
% %     contour(xx,yy,ddPore3,[hydrofrac hydrofrac],'b--','linewidth',2)
%     
%    
% %     
% %     dP_best=F_dP(xp_best,yp_best);
% %     [xp1,yp1]=strikedip_toStereo(strike1,dip1);
% %     [xp2,yp2]=strikedip_toStereo(strike2,dip2);
% %     dP1=F_dP(xp1,yp1);
% %     dP2=F_dP(xp2,yp2);
% % 
% %     
% %     
%     
%     
%     
%     
    
    
    
    
    
    
    
    
    
    
    
    