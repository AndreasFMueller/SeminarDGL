a0 = linspace(pi/12,pi/2,100);
delta = [];
radius = 6371;

for i = 1:length(a0)
    %calculate duration of simulation
    xmax = radius + 3*radius*cos(a0(i));
    ymax = 3*radius*sin(a0(i));
    phimax = atan(ymax/xmax);
    
    %calculate r'
    dr0 = radius/tan(a0(i));
    
    %call odey
    %a0(i)
    %phimax
    [phi,r] = call_sphere_ode_corr(radius, dr0, phimax);
    
    %get x and y coordinates
    x = zeros(1,length(phi));
    y = zeros(1,length(phi));
    x = r(:,1).*cos(phi);
    y = r(:,1).*sin(phi);
    
    %calculate delta
    l = length(x);
    delta = (180/pi)*(atan(( y(2)-y(1) )/( x(2)-x(1) ))-atan(( y(l)-y(l-1) )/( x(l)-x(l-1) )));
    
end

plot(a0,delta);
