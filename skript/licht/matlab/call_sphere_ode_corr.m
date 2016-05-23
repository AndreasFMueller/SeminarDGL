function [phi, r] = call_sphere_ode_corr(dr0, phimax)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    mu = 2.93e-4; %2.93e-4
    sigma = 1000/4; %1000/7
    radius = 6.371; %6.371
    initial = [radius, dr0];
    span = [0, phimax];
    %options = odeset('RelTol',1.e-10,'AbsTol',1.e-12, 'InitialStep',1e-24);
    %options = odeset('RelTol',1.e-8,'AbsTol',1.e-10);
    %options = odeset('InitialStep',1e-24);
    options = odeset();
    [phi, r] = ode45(@ode, span, initial, options); %45
    print_coord(phi, r(:,1));
    getDelta(phi,r);
    polar(phi, r(:,1));
    
    function dr = ode(phi, r)
        dr = [r(2); (fdn(r(1))*r(2)^2 + fdn(r(1))*r(1)^2 + 2*fn(r(1))*r(2)^2 + fn(r(1)) * r(1)^2)/(fn(r(1)) * r(1))];
    end

    function n = fn(r)
        n = 1 + mu * exp(-sigma*(r-radius));
        %n = 1;
        %n = 1 + mu * exp(-(r-2)^2*sigma);
        
        %if r<radius 
        %    n = 1 + mu * (radius-r)^2;
        %else
        %    n = 1;
        %end
    end

    function dn = fdn(r)
        dn = -sigma * mu * exp(-sigma * (r-radius));
        %dn = 0;
        %dn = -2 * mu * sigma * (r - 2) * exp(-sigma * (r-2)^2);
        
        %if r<radius
        %    dn = 2*mu * (r-radius);
        %else
        %    dn = 0;
        %end   
    end

    function [] = print_coord(phi, r)
        scopy = '';
        for m = 1:size(phi)
           %fprintf('(%4.0f, %4.0f) ', (r(m)*cos(phi(m)+pi/2)),(r(m)*sin(phi(m)+pi/2))); 
           scopy = strcat(scopy, sprintf('(%2.4f,%2.4f) ', (r(m)*cos(phi(m))), (r(m)*sin(phi(m)))));
        end
        clipboard('copy', scopy);
        fprintf('\n0');
    end
end

