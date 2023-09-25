%*************************************************************************%
%                                                                         %
%   function NOISY_MECHANISMS                                             %
%                                                                         %
%   generating noisy mechanisms                                           %
%                                                                         %
%   input: strke, dip and rake                                            %
%          noise_level                                                    %
%                                                                         %
%*************************************************************************%
function [strike1_noisy,dip1_noisy,rake1_noisy,strike2_noisy,dip2_noisy,rake2_noisy] = aux_planes(strike,dip,rake)
N=length(strike);
strike1_noisy=zeros(N,1);
strike2_noisy=zeros(N,1);
dip1_noisy=zeros(N,1);
dip2_noisy=zeros(N,1);
rake1_noisy=zeros(N,1);
rake2_noisy=zeros(N,1);
for i=1:N
    n(1) = -sin(dip(i)*pi/180).*sin(strike(i)*pi/180);
    n(2) =  sin(dip(i)*pi/180).*cos(strike(i)*pi/180);
    n(3) = -cos(dip(i)*pi/180);

    u(1) =  cos(rake(i)*pi/180).*cos(strike(i)*pi/180) + cos(dip(i)*pi/180).*sin(rake(i)*pi/180).*sin(strike(i)*pi/180);
    u(2) =  cos(rake(i)*pi/180).*sin(strike(i)*pi/180) - cos(dip(i)*pi/180).*sin(rake(i)*pi/180).*cos(strike(i)*pi/180);
    u(3) = -sin(rake(i)*pi/180).*sin(dip(i)*pi/180);     
    
    [strike1,dip1,rake1,strike2,dip2,rake2] = strike_dip_rake(n,u);

    strike1_noisy(i,1) = strike1; 
    dip1_noisy(i,1) = dip1; 
    rake1_noisy(i,1) = real(rake1);
    strike2_noisy(i,1) = strike2; 
    dip2_noisy(i,1) = dip2; 
    rake2_noisy(i,1) = real(rake2);

end



end

