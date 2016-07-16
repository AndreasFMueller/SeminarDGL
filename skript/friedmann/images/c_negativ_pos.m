function dydt = c_negativ_pos(t, y, E)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    if 1/y > E
       dydt = sqrt(1/y - E);
    else
       dydt = 0;
    end
end

