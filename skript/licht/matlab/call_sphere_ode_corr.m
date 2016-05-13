function [phi, r] = call_sphere_ode_corr( r0, dr0, phimax)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    mu = 1;
    sigma = 2;
    initial = [r0, dr0];
    span = [0, phimax];
    [phi, r] = ode45(@ode, span, initial);
    print_coord(phi, r(:,1));
    polar(phi, r(:,1));
    
    function dr = ode(phi, r)
        dr = [r(2); (fdn(r(1))*r(2)^2 + fdn(r(1))*r(1)^2 + 2*fn(r(1))*r(2)^2 + fn(r(1)) * r(1)^2)/(fn(r(1)) * r(1))];
    end

    function n = fn(r)
        n = 1 + mu * exp(-sigma*(r-1));
        %n = 1;
        %n = 1 + mu * exp(-(r-2)^2*sigma);
        %n = 1 + mu * (2-r)^2;
    end

    function dn = fdn(r)
        dn = -sigma * mu * exp(-sigma * (r-1));
        %dn = 0;
        %dn = -2 * mu * sigma * (r - 2) * exp(-sigma * (r-2)^2);
        %dn = 2*mu * (r-2);
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

