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
for subregion=1:99
 definePolygonSubregions
toplot=0;if subregion==1;toplot=1;end
within=find(inpolygon(Lon_all,Lat_all,Poly(:,1),Poly(:,2)) );%& z<=26 & (Lat>61 | z<15 | Lon>-140 | Lon<-150) & (Lon>-146 | Lon<-148.5 | Lat>62) & (Lon>-141.4 | Lon<-142 | Lat>62));
within=unique(within);Lon=Lon_all(within);Lat=Lat_all(within);z=z_all(within);
mechs=mechs_all(within,:);D=ones(length(within),1);
tx=mean(Lon);ty=mean(Lat);if subregion~=1; mark(within)=mark(within)+1; figure(1); text(tx,ty,name,'HorizontalAlignment','center');plotpt(Poly,'k');end
%      misfitAlaskaSubregionInversion
     runAlaskaSubregionInversion
% %      FSPAlaska
 output(subregion,:)=[mean(Lon) mean(Lat) A_phi SHmax 0.6];
 output2(subregion,:)=[mean(Lon) mean(Lat) A_phi_low SHmax_max2 1];
 output3(subregion,:)=[mean(Lon) mean(Lat) A_phi_high SHmax_min2 1];
 output4(subregion,:)=[mean(Lon) mean(Lat) A_phi_high SHmax_max2 1];
 output5(subregion,:)=[mean(Lon) mean(Lat) A_phi_low SHmax_min2 1];
 allvertices=[allvertices;999 999;Poly];
 if length(within)<25;fprintf([name ' has ' num2str(length(within)) ' data \n']);end
 if var(aphi)>0.2;  fprintf([name ' has aphi variance ' num2str(var(aphi)) ' \n']);end
 strike1=mechs(:,1);StressStereonet2;set(gcf,'position',[1 509 378 357]);saveas(gcf,plot_file,'jpg')
pause(0.01)
%       fprintf([name ' has aphi variance ' num2str(var(aphi)) ' \n'])
end
%%
%
plot(Lon_all(mark==0),Lat_all(mark==0),'g*','markersize',30)
%  unused=[Lon_all(mark==0) Lat_all(mark==0) mechtype(mark==0) mechSH(mark==0) 0.3+0*mechSH(mark==0)];
allvertices(allvertices<-179.99)=-179.99;
dlmwrite('AKPaxes4',output(2:end,:),'\t')
dlmwrite('AKPaxes4_lowmax',output2(2:end,:),'\t')
dlmwrite('AKPaxes4_highmin',output3(2:end,:),'\t')
dlmwrite('AKPaxes4_highmax',output4(2:end,:),'\t')
dlmwrite('AKPaxes4_lowmin',output5(2:end,:),'\t')
% % % % % dlmwrite('unusedPaxes3',unused,'\t')
dlmwrite('BoxVertices',allvertices,'\t')
