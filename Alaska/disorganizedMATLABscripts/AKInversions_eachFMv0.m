%%% make Wrangell block (Southern AK block), Bering microplate, Arctic microplate
%%% note volcanoes! Stress studies have been done for Reboubt, Spurr, and Katmai
%%% compute misfits-40 degrees is high, variance of R (same as Aphi?)-0.2 is high
%%% previous: 20x20km grid, inverting the 12 nearest FMs
%%% stronger slab-NaM coupling around Prince Wm Sound - same SHmax up to
%%% 200 km inland as in slab; previous work unsure about contamination
%%% previous: Greatest variations Cook Inlet to E Castle Mtn Fault: near
%%% edge of Wrangell block?...or at least in the western half of WrBl
%%% previous: Interactions btw Wrangell and Bering unclear. More data now?

cc
setcrustalFMs
toplot=1;subregion=1;
classifyAndPlot
% toplot=0;
figure(997);
a=find(z>20 & type<=1);plot3(Lon(a),Lat(a),-z(a),'ro','markerfacecolor','r')
a=find(z>20 & type<=1);plot3(Lon(a),Lat(a),0*-z(a),'ro','markerfacecolor','r')
a=find(z<20 & type<=1);plot3(Lon(a),Lat(a),-z(a),'go','markerfacecolor','g')
ylim([59 66]);xlim([-154 -145])

Lon_all=Lon;Lat_all=Lat;z_all=z;mechs_all=mechs;
% 


lons=Lon_all;
lats=Lat_all;
w=0.2;
mark=0*Lat_all;
n_used=0*lons;
tic
for subregion = 1:numel(lons)
    
%     
%      Poly= [lons(subregion)-1.11*w lats(subregion)+0.5*w
%            lons(subregion)+1.11*w lats(subregion)+0.5*w
%            lons(subregion)+1.11*w lats(subregion)-0.5*w
%            lons(subregion)-1.11*w lats(subregion)-0.5*w
%            lons(subregion)-1.11*w lats(subregion)+0.5*w];
%    
% 
%  within=find(inpolygon(Lon_all,Lat_all,Poly(:,1),Poly(:,2)) );%& z<=26 & (Lat>61 | z<15 | Lon>-140 | Lon<-150) & (Lon>-146 | Lon<-148.5 | Lat>62) & (Lon>-141.4 | Lon<-142 | Lat>62));
dx=(Lon_all-lons(subregion) ).*cosd(lats(subregion)/2+Lat_all/2)*113.12;
dy=(Lat_all-lats(subregion) )*111;
dr=sqrt(dx.^2+dy.^2);
within=find(dr<10);
D=ones(length(within),1);
 if length(within)<12
        within=find(dr<=quantile(dr,12/length(dr)));
        D=ones(length(within),1)*10;
        dr=dr(within);
         D(dr>D)=dr(dr>D);
  end 
        within=unique(within);
Lon=Lon_all(within);Lat=Lat_all(within);z=z_all(within);
mechs=mechs_all(within,:);
n_used(subregion)=length(within);

weights=1./D;weights=weights/sum(weights);
tx=lons(subregion);%dot(Lon,weights);
ty=lats(subregion);%dot(Lat,weights);

%  tx=mean(Lon);ty=mean(Lat);
% if subregion~=1;
    mark(within)=mark(within)+1;
%     figure(1);
%     text(tx,ty,num2str( subregion),'HorizontalAlignment','center');
% %     plotpt(Poly,'b')
% plot(Lon,Lat,'b*')
% end
plot_file=['subregion' num2str(subregion)];
name=['subregion' num2str(subregion)];
    runAlaskaSubregionInversion
%      gam=0*aphi+NaN;
% 
% % z=maindepth;Pp=-9.8; Sv=-25;Sv=Sv*z;Pp=Pp*z+dPp;
% % 
% % for i=1:num_realizations
% %         friction=fric(i);gamma=( sqrt(friction^2+1) +friction)^2;
% % tau=tau_all(:,:,i);
% %     e=eig(tau);phi=(e(2)-e(3))/(e(1)-e(3));
% %    if aphi(i)<1
% %        s1=Sv;
% %        s3=Pp+(s1-Pp)/gamma;
% %        s2=(1-phi)*s3+phi*s1; 
% %        sh1=s2;sh2=s3;
% %    end
% %     if aphi(i)>=1 && aphi(i)<2
% %        s2=Sv;
% %         s3= (Sv/phi - Pp + gamma*Pp) / (1/phi -1 + gamma);
% %         s1=(Sv-s3)/phi + s3;
% %         sh1=s1;
% %         sh2=s3;
% %    end
% %    if aphi(i)>=2
% %        s3=Sv;
% %       s1=Pp+gamma*(s3-Pp);
% %       s2=(1-phi)*s3+phi*s1; 
% %        sh1=s1;sh2=s2;
% %    end
% %    gam(i)=(sh1+sh2-2*Sv)/(sh1-sh2);
% % end
% 
% % figure(1001);
% % plot(aphi,gam,'ko');hold on
% pause(0.01)
% gams(subregion)=0;%median(gam);
% gams2(subregion)=0;%mean(gam);
% %      FSPAlaska
%  output(subregion,:)=[tx ty A_phi_high2 SHmax_max2 0.6 median(gam(~isnan(gam)))];
%  output2(subregion,:)=[tx ty A_phi_high2 SHmax_min2 0.6 median(gam(~isnan(gam)))];
%  output3(subregion,:)=[tx ty A_phi SHmax_max2 0.45 median(gam(~isnan(gam)))];
%  output4(subregion,:)=[tx ty A_phi SHmax_min2 0.45 median(gam(~isnan(gam)))];
%  output5(subregion,:)=[tx ty A_phi_low2 SHmax_max2 0.3 median(gam(~isnan(gam)))];
%  output6(subregion,:)=[tx ty A_phi_low2 SHmax_min2 0.3 median(gam(~isnan(gam)))];
 output7(subregion,:)=[tx ty A_phi SHmax 0.3 ];%median(gam(~isnan(gam)))];
%  
%  %%% Aphi ap comp ext
%  %%% 0.5  0  0   1
% %%% 1.5   0.5  0.5 0.5
% %%% 2.5  1   1   0
% ap=A_phi;if ap<0.5;ap=0.5;end;if ap>2.5; ap=2.5;end
% ap=ap-0.5;ap=ap/2;ext=1-ap;
%  output8(subregion,:)=[tx ty 2.5 SHmax ap/4 ];
%  output9(subregion,:)=[tx ty 0.5 SHmax+90 ext/4 ];
% 
% %  output(subregion,:)=[mean(Lon) mean(Lat) A_phi SHmax 0.3];
% %  pause(0.01)
 if mod(subregion,50)==0;fprintf([num2str(round(100*subregion/length(n_used))) ' percent done ']);toc;end
end
toc
% a=[lons lats general_misfitL1'/200];
% dlmwrite('gridMisfit',a,'\t')
% foo=find(general_misfitL1>45);
% a=[lons(foo) lats(foo) general_misfitL1(foo)'/200];
% dlmwrite('gridMisfit_45',a,'\t')
% make_contour(lons,lats,general_misfitL2',0.2,0.5);
% plot(lons,lats,'ko')
% make_contour(output7(:,1),output7(:,2),output7(:,end),0.1,2.5);colormap(flipud(jet));caxis([-3 3])
% make_contour(output7(:,1),output7(:,2),output7(:,3),0.1,2.5);colormap(flipud(jet));caxis([0.5 2.5])
dlmwrite('AKPaxes_12neighbors_weighted',output7,'\t')
% % dlmwrite('AKPaxes1gridw025_n20_weighted',output,'\t')
% % dlmwrite('AKPaxes2gridw025_n20_weighted',output2,'\t')
% % dlmwrite('AKPaxes3gridw025_n20_weighted',output3,'\t')
% % dlmwrite('AKPaxes4gridw025_n20_weighted',output4,'\t')
% % dlmwrite('AKPaxes5gridw025_n20_weighted',output5,'\t')
% % dlmwrite('AKPaxes6gridw025_n20_weighted',output6,'\t')
% dlmwrite('AKPaxes_comp_weighted',output8,'\t')
% dlmwrite('AKPaxes_ext_weighted',output9,'\t')
% % 
% % foo=find(output9(:,3)<0.33);output9(foo,3)=0;
% % foo=find(output8(:,3)<0.33);output8(foo,3)=0;
% % output=load('AKPaxes1gridw025_n20_weighted');
% % 
% % F=scatteredInterpolant(output(:,1),output(:,2),output(:,3),'natural','none');
% % [nn,tt]=gridxy(Lon_all,Lat_all,0.1);
% % nn=mat2vec(nn);tt=mat2vec(tt);
% % aa=F(nn,tt);
% % aa1=aa;
% % for i=1:numel(nn)
% %     if isempty(find(abs(Lon_all-nn(i))<3 & abs(Lat_all-tt(i))<3))
% %         aa1(i)=NaN;
% %     end
% % end
% % dlmwrite('interpAphi_grid_weighted',[nn tt aa1],'\t')
