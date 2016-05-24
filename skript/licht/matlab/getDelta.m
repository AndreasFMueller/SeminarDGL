function [ delta ] = getDelta( phi,r )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    %x = r(:,1).*cos(phi);
    %y = r(:,1).*sin(phi);
    %delta = [];
    
    %l = length(phi);
    %delta(1) = (180/pi) * (atan( (y(l)-y(l-1))/(x(l)-x(l-1)) ) - atan( (y(2)-y(1))/(x(2)-x(1)) ));

    f =  r(:,1);
    df = r(:,2);
    
    l = length(phi);
    
    if (phi(l)>pi/2)
        angleEnd = 180 + (atand( (f(l) * cos(phi(l)) + df(l)*sin(phi(l)) )/(-f(l)*sin(phi(l)) + df(l)*cos(phi(l))) ));
    else
        angleEnd = (atand( (f(l) * cos(phi(l)) + df(l)*sin(phi(l)) )/(-f(l)*sin(phi(l)) + df(l)*cos(phi(l))) ));
    end
    angleStart = (atand( (f(1) * cos(phi(1)) + df(1)*sin(phi(1)) )/(-f(1)*sin(phi(1)) + df(1)*cos(phi(1))) ));
    
    angleStart
    angleEnd
    l
    
    delta = angleEnd-angleStart;
    delta
    
end

