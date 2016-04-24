function [phi, r] = call_sphere_ode()
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    span = [0 1]; %angle Interval
    r0 = 1;
    [phi,r] = ode45(@dstate, span, r0);
    polar(phi,r)
    print_coord(phi,r)
    
    function n = funcN(r)
        mu = 0.5;
        sigma = 1/4;
        n = 1 + mu * exp(-sigma * (r-1));
    end
    
    function dydt = dstate(phi,r)
        epsilon = 0.454 * funcN(0) * r0;
        dydt = sqrt((funcN(r)*r^2/epsilon)^2 - r^2);
    end

    function [] = print_coord(phi, r)
        scopy = '';
        for m = 1:size(phi)
           fprintf('(%2.5f, %2.5f) ', (r(m)*cos(phi(m)+pi/2)),(r(m)*sin(phi(m)+pi/2))); 
           scopy = strcat(scopy, sprintf('(%2.5f,%2.5f) ', (r(m)*cos(phi(m)+pi/2)), (r(m)*sin(phi(m)+pi/2))));
        end
        clipboard('copy', scopy);
        fprintf('\n0');
    end
end