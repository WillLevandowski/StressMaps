maindepth=5; 
dPp=0;

SDR=[Lon Lat mechs(:,1:3)];
mean_deviation =15; 
    friction_mean=0.6;
    friction_spread=0.6;    
    N_realizations = 5; 
    N_iterations = 5; 
    num_realizations=101; % number of times to resample the FMs and invert
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
% misfits
% for i=1:length(SDR)
% s=SDR(i,1);d=SDR(i,2);n1 = -sin(d*pi/180).*sin(s*pi/180);n2 =  sin(d*pi/180).*cos(s*pi/180);n3 = -cos(d*pi/180);
% N=1;
%   A1 = zeros(N,5); A2 = zeros(N,5); A3 = zeros(N,5); 
% A11_n = [ n1.*(1  -n1.^2)];
% A21_n = [      -n1.*n2.^2];
% A31_n = [      -n1.*n3.^2];
% A41_n = [   -2*n1.*n2.*n3];
% A51_n = [ n3.*(1-2*n1.^2)];
% A61_n = [ n2.*(1-2*n1.^2)];
% A12_n = [      -n2.*n1.^2];
% A22_n = [ n2.*(1-  n2.^2)];
% A32_n = [      -n2.*n3.^2];
% A42_n = [ n3.*(1-2*n2.^2)];
% A52_n = [   -2*n1.*n2.*n3];
% A62_n = [ n1.*(1-2*n2.^2)];
% A13_n = [      -n3.*n1.^2];
% A23_n = [      -n3.*n2.^2];
% A33_n = [ n3.*(1-  n3.^2)];
% A43_n = [ n2.*(1-2*n3.^2)];
% A53_n = [ n1.*(1-2*n3.^2)];
% A63_n = [   -2*n1.*n2.*n3];
% A1 = [A11_n A21_n A31_n A41_n A51_n A61_n]; 	
% A2 = [A12_n A22_n A32_n A42_n A52_n A62_n]; 	
% A3 = [A13_n A23_n A33_n A43_n A53_n A63_n]; 	
% A = [A1; A2; A3];
% A(3*N+1,1:3  ) = 1; 
% 
% stress_vector=[tau(1,1);tau(2,2);tau(3,3);tau(3,2);tau(3,1);tau(2,1)];
% pred_a=A*stress_vector;
% 
%     rs=0:180;misfits=0*rs;
%     for j=1:length(rs)
%         r=rs(j);
%    u1 =  cos(r*pi/180).*cos(s*pi/180) + cos(d*pi/180).*sin(r*pi/180).*sin(s*pi/180);
% u2 =  cos(r*pi/180).*sin(s*pi/180) - cos(d*pi/180).*sin(r*pi/180).*cos(s*pi/180);
% u3 = -sin(r*pi/180).*sin(d*pi/180); 
%     a_vector=[u1;u2;u3]; a_vector(3*N+1,1) = 0;
%     pred_slip=[pred_a(1:N) pred_a(N+1:2*N) pred_a(2*N+1:N*3)];dot_=0*u1;u=[u1 u2 u3];
% 
% % for i=1:N
% %     pred_slip(i,:)=pred_slip(i,:)/norm(pred_slip(i,:));
% % dot_(i)=dot(pred_slip(i,:),u(i,:));
% % % if dot_(i)<0
% % % dot_(i)=dot(pred_slip(i,:),-u(i,:));
% % % end
% % end
% 
% misfits(j)=acosd(dot_);
%     end
%     best_rake(i)=rs(misfits==min(misfits));
% %     figure(999);hold on
% %      scatter(rs,misfits,3,'ko','filled');alpha(0.1)
% %      ,'markersize',1,'markerfacealpha',0.2);%title(['SHmax N' num2str(median(SHMAX_all) + ang) 'E  rake = ' num2str(best_rake)])
% % pause(0.01)
% end
% 

% figure;plot(Lon,Lat,'ko');hold on;
% foo=find(misfits>20);plot(Lon(foo),Lat(foo),'o','color',[0 1 0],'markerfacecolor',[0 1 0])
% foo=find(misfits>30);plot(Lon(foo),Lat(foo),'o','color',[1 1 0],'markerfacecolor',[1 1 0])
% foo=find(misfits>40);plot(Lon(foo),Lat(foo),'o','color',[1 0.5 0],'markerfacecolor',[1 0.5 0])
% foo=find(misfits>50);plot(Lon(foo),Lat(foo),'o','color',[1 0 0],'markerfacecolor',[1 0 0])
%  plotpt(Poly,'k')
    for realizations=1:num_realizations
          strike=SDR(:,3);dip=SDR(:,4);rake=SDR(:,5);num_obs=length(SDR(:,1));
          rake(rake==0)=1;
        STYLE(realizations)=999; %%% initialize
        while STYLE(realizations)>2  %%% Will be set to normal, strike-slip, or thrust, following the convention of Zoback (1992, JGR)
            friction=friction_mean+friction_spread*(rand-0.5); if realizations ==num_realizations;friction=0.7;end
            [Dist_keep,strike1,dip1,rake1,strike2,dip2,rake2,n_error,u_error] = noisy_mechanisms_DistWeighted(mean_deviation,strike,dip,rake,D.^2);    
            [tau_realization,misfits,d1,d2,d3,sigma_vector_1,sigma_vector_2,sigma_vector_3,shape_ratio_noisy, ...
                     ~,~,~] = statistics_stress_inversion_misfit_dumptau(strike1,dip1,rake1,strike2,dip2,rake2,friction,N_iterations,N_realizations,Dist_keep); 
            dir_s1(realizations,:)=d1';dir_s2(realizations,:)=d2';dir_s3(realizations,:)=d3';
            sigma_vector_1_statistics (:,realizations) = sigma_vector_1;sigma_vector_2_statistics (:,realizations) = sigma_vector_2;sigma_vector_3_statistics (:,realizations) = sigma_vector_3;
            shape_ratio_statistics    (realizations)   = shape_ratio_noisy;
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
            fric(realizations)=friction;
            tau_all(:,:,realizations)=tau_realization;
            misfit_all(realizations)=mean(misfits);

    end
misfit_inversion(subregion)=mean(misfit_all);
 tau2output
        
        