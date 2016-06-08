function [  ] = copy_coords( x,y )
%COPY_COORDS Summary of this function goes here
%   Detailed explanation goes here

    scopy = '';
    for m = 1:length(x)
       scopy = strcat(scopy, sprintf('(%2.4f,%2.4f) ', x(m), y(m)));
    end
    clipboard('copy', scopy);
    fprintf('\n0');

end

