close all

dat=load('Resources/CMT_India_Lat7to28_Lon67to90.txt');
Lon=dat(:,1);Lat=dat(:,2);mechs=dat(:,3:8);
ClassifyAndPlot;Lon_all=Lon;Lat_all=Lat;mechs_all=mechs;
 dlmwrite('All_IndiaPaxes',[lonplot(type~=0) Lat(type~=0) type(type~=0) SH(type~=0) 0*SH(type~=0)+0.3],'\t')
 
 %% for each subregion, define boundaries and plot, select included mechanisms
 
 subregion=1;
     Poly=[84 26;84 30;90 30;90 26;84 26];name='Garhwal';plot_file='Garhwal_StressStereo';
     within=find(inpolygon(Lon_all,Lat_all,Poly(:,1),Poly(:,2)) );%& z<=26 & (Lat>61 | z<15 | Lon>-140 | Lon<-150) & (Lon>-146 | Lon<-148.5 | Lat>62) & (Lon>-141.4 | Lon<-142 | Lat>62));
     within=unique(within);Lon=Lon_all(within);Lat=Lat_all(within);
     mechs=mechs_all(within,:);D=ones(length(within),1);
     tx=mean(Lon);ty=mean(Lat);
        figure(1); text(tx,ty,[name ' n=' num2str(length(within))],'HorizontalAlignment','center');plotpt(Poly,'k');

    %% inversion 
% maindepth=5; dPp=0;

SDR=[Lon Lat mechs(:,1:3)];
mean_deviation =15; 
    friction_mean=0.6;
    friction_spread=0.6;    
    N_realizations = 5; 
    N_iterations = 5; 
    num_realizations=21; % number of times to resample the FMs and invert
    tau_all=zeros(3,3,num_realizations);

    no_regime_count=0;
    STYLE=zeros(num_realizations,1);
    SHMAX_all=zeros(num_realizations,1);
    n_error_=zeros(num_realizations,1);
    u_error_=zeros(num_realizations,1);
    fric=zeros(num_realizations,1);
    misfit=zeros(num_realizations,1);
    dir_s1=zeros(num_realizations,2);
    dir_s2=zeros(num_realizations,2);
    dir_s3=zeros(num_realizations,2);
    misfit_all=zeros(num_realizations,1);
    shape_ratio_statistics=zeros(num_realizations,1);
    sigma_vector_1_statistics=zeros(3,num_realizations);
    sigma_vector_2_statistics=zeros(3,num_realizations);
    sigma_vector_3_statistics=zeros(3,num_realizations);
   
    [a,b,c,d,e,f]=aux_planes(SDR(:,3),SDR(:,4),SDR(:,5));
 
   [tau,misfits,d1,d2,d3,sigma_vector_1,sigma_vector_2,sigma_vector_3,shape_ratio_noisy, ...
    ~,~,~] = statistics_stress_inversion_misfit_dumptau(a,b,c,d,e,f,friction_mean,N_iterations,N_realizations,D); 

general_misfitL1(subregion)=mean(abs(misfits));
general_misfitL2(subregion)=sqrt(mean(misfits.^2));

  for realizations=1:num_realizations
          strike=SDR(:,3);dip=SDR(:,4);rake=SDR(:,5);num_obs=length(SDR(:,1));
          rake(rake==0)=1;
        STYLE(realizations)=999; %%% initialize
        while STYLE(realizations)>2  %%% Will be set to normal, strike-slip, or thrust, following the convention of Zoback (1992, JGR)
            friction=friction_mean+friction_spread*(rand-0.5);  if realizations ==num_realizations;friction=friction_mean;end
            
            %%% add noise to data and jackknife
            [Dist_keep,strike1,dip1,rake1,strike2,dip2,rake2,n_error,u_error] = noisy_mechanisms_DistWeighted(mean_deviation,strike,dip,rake,D.^2);  
            
            %%% do the inversion
            [tau_realization,misfits,d1,d2,d3,sigma_vector_1,sigma_vector_2,sigma_vector_3,shape_ratio_noisy, ...
                     ~,~,~] = statistics_stress_inversion_misfit_dumptau(strike1,dip1,rake1,strike2,dip2,rake2,friction,N_iterations,N_realizations,Dist_keep); 
            
            %%% catalog outputs
            dir_s1(realizations,:)=d1';dir_s2(realizations,:)=d2';dir_s3(realizations,:)=d3';
            sigma_vector_1_statistics (:,realizations) = sigma_vector_1;sigma_vector_2_statistics (:,realizations) = sigma_vector_2;sigma_vector_3_statistics (:,realizations) = sigma_vector_3;
            shape_ratio_statistics    (realizations)   = shape_ratio_noisy;
            
            %%% determine the associated faulting style
             n=999; SHMAX_all(realizations)=999;
            if d1(2) > 52 && d3(2) < 35 ;  n=0;SHMAX_all(realizations)=d2(1); end
            if d1(2) > 40 && d1(2) <  52 && d3(2) < 20; n=0 ; SHMAX_all(realizations)=d3(1)+90;  end
            if d1(2) < 40 && d2(2) > 45 && d3(2) < 20 ; n=1;  SHMAX_all(realizations)=d3(1)+90; end
            if d1(2) < 20 && d2(2) > 45 && d3(2) < 40 ; n=1; SHMAX_all(realizations)=d1(1); end
            if d1(2) < 20  &&  d3(2) > 40 && d3(2) < 52 ; n=2; SHMAX_all(realizations)=d1(1); end
            if d1(2) < 35  && d3(2) > 52  ;  n=2; SHMAX_all(realizations)=d1(1); end
            STYLE(realizations)=n;
            if STYLE(realizations)==999; no_regime_count=no_regime_count+1; 
%                 if mod(no_regime_count,10)==1
%                     fprintf([num2str(no_regime_count) ' iterations have failed out of ' num2str(realizations) '\n']); 
%                 end
            end
        end
            
            %%% store results and parameter values
            fric(realizations)=friction;
            tau_all(:,:,realizations)=tau_realization;
            misfit_all(realizations)=mean(misfits);

  end
 
misfit_inversion(subregion)=mean(misfit_all);

%%% reformat some outputs
 tau2output 
 
 %%% store outputs for GMT plotting
  output(subregion,:)=[mean(Lon) mean(Lat) A_phi SHmax 0.6];
 output2(subregion,:)=[mean(Lon) mean(Lat) A_phi_low SHmax_max2 1];
 output3(subregion,:)=[mean(Lon) mean(Lat) A_phi_high SHmax_min2 1];
 output4(subregion,:)=[mean(Lon) mean(Lat) A_phi_high SHmax_max2 1];
 output5(subregion,:)=[mean(Lon) mean(Lat) A_phi_low SHmax_min2 1];
%  allvertices=[allvertices;999 999;Poly];
 
 %%% low-key warnings
 if length(within)<25;fprintf([name ' has ' num2str(length(within)) ' data \n']);end
 if var(aphi)>0.2;  fprintf([name ' has aphi variance ' num2str(var(aphi)) ' \n']);end
 
 
 strike1=mechs(:,1);StressStereonet2;set(gcf,'position',[1 509 378 357]);
    text(0.8,-0.8,['Misfit ' num2str(round(general_misfitL1(subregion))) '°'])
     text(0.8,-0.875,['Misfit ' num2str(round(general_misfitL2(subregion))) '°'])
saveas(gcf,plot_file,'jpg')