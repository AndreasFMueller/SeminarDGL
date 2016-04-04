figure;
hold on;
for m = [0.4:0.4:4]
    [t,y] = call_ode_corr(0,m);
    plot(t,y(:,1));
end
axis([0 5 -2 6]);
hold off;