 
aphi=(STYLE+0.5)+(-1).^STYLE.*(shape_ratio_statistics-0.5);
% 
aphi_=aphi;
foo=find( abs(aphi-median(aphi))>0.75);
aphi_(foo)=median(aphi);


A_phi=mean(aphi_);
A_phi_low=quantile(aphi_,0.16);
A_phi_high=quantile(aphi_,0.84);
A_phi_low2=quantile(aphi_,0.05);
A_phi_high2=quantile(aphi_,0.95);
Aphi_uncert=(A_phi_high-A_phi_low)/4 + (A_phi_high2-A_phi_low2)/(4*1.645);
SHMAX_all=mod(SHMAX_all,180); 
for adjust=1:5
 SHmax=median(SHMAX_all);
 foo=find(SHMAX_all>SHmax+90); SHMAX_all(foo)=SHMAX_all(foo)-180;
 foo=find(SHMAX_all<SHmax-90); SHMAX_all(foo)=SHMAX_all(foo)+180;
 SHMAX_all(SHMAX_all>360)=SHMAX_all(SHMAX_all>360)-360;
  SHmax=median(SHMAX_all);
end
SHmax_max=quantile(SHMAX_all,0.84);
SHmax_min=quantile(SHMAX_all,0.16);
SHmax_max2=quantile(SHMAX_all,0.95);
SHmax_min2=quantile(SHMAX_all,0.05);
SH_uncert=(SHmax_max-SHmax_min)/4 + (SHmax_max2-SHmax_min2)/(4*1.645) ;
