function [] = plot_ode(t, y)
    for m = 1:size(t)
       fprintf('(%2.5f, %2.5f) ', t(m), y(m)); 
    end
end