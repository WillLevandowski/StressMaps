% figure; hold on; %title('Confidence of principal stress axes                 ','FontSize',16);
axis off; axis equal; axis([-1.05 1.05 -1.05 1.05]);

%--------------------------------------------------------------------------

  % boundary circle and the centre of the circle
fi=0:0.1:360;				
plot(cos(fi*pi/180.),sin(fi*pi/180.),'k')
% plot(0,0,'k+','MarkerSize',10);		

%--------------------------------------
%--------------------------------------------------------------------------
% grid lines - constant theta
for theta_grid = 0:15:90
    radius_grid = sin(theta_grid*pi/360.);
    
    x_grid = sqrt(2.)*radius_grid*cos(fi*pi/180.);
    y_grid = sqrt(2.)*radius_grid*sin(fi*pi/180.);

    plot(y_grid,x_grid,'LineWidth',0.5,'color',[0.6 0.6 0.6]);
end

%--------------------------------------------------------------------------
% grid lines - constant fi
theta_grid = 0:15:90;

for fi_grid = 0:15:360
    radius_grid = sin(theta_grid*pi/360.);
    
    x_grid = sqrt(2.)*radius_grid*cos(fi_grid*pi/180.);
    y_grid = sqrt(2.)*radius_grid*sin(fi_grid*pi/180.);

    plot(y_grid,x_grid,'LineWidth',0.5,'color',[0.6 0.6 0.6]);
end
%---


% sd=[0 90;
%     45 90
%     45 45
%     ];
% strike=sd(:,1);
% dip=sd(:,2);
% radii=dip/90;
% 
% s2=90-strike;
% x=cosd(s2);
% y=sind(s2);
% 
% x=x.*radii;
% y=y.*radii;
% 
% plot(x,y,'*')
