function [t,y] = call_ode()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    tspan = [0 10]; %time Interval
    y0 = 0;
    [t,y] = ode45(@dstate, tspan, y0);
    plot(t,y)
    print_values(t,y);
    
    function n = funcN(y)
        mu = 0.5;
        sigma = 1/5;
        n = 1 + mu * exp(-sigma * y);
    end
    
    function dydt = dstate(t,y)
        epsilon = 0.707 * funcN(0);
        dydt = sqrt((funcN(y)/epsilon)^2 - 1);
    end

    function [] = print_values(t, y)
        for m = 1:size(t)
           fprintf('(%2.5f, %2.5f) ', t(m), y(m)); 
        end
    end
    
end