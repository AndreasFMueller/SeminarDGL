function [t,y] = call_ode_corr(y0, dy0)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    initial = [y0, dy0];
    [t,y] = ode45(@ode, [0 10], initial);
    print_values(t,y(:,1));
   
    
    function dy = ode(t,y)
        if y(2) <= 0.001 && y(2) >= -0.001
            dy = [0; 0];
        else
            dy = [y(2); (func(y(1)) * ((y(2) * y(2)) + 1))];
        end
    end
    
    function [] = print_values(t, y)
        scopy = '';
        for m = 1:size(t)
           fprintf('(%2.5f, %2.5f) ', t(m), y(m)); 
           scopy = strcat(scopy, sprintf('(%2.5f,%2.5f) ', t(m), y(m)));
        end
        clipboard('copy', scopy);
        fprintf('\n');
    end

    function ret = func(y)
        mu = 0.6;
        sigma = 1/2;
        ret = (-sigma/(1+1/(mu * exp(-sigma * y))));
    end

end