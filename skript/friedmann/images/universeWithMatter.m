y0 = 1e-5;
opts = odeset('RelTol',1e-10,'AbsTol',1e-10, 'InitialStep', 1e-10);
f = figure; 
clf; 
hold on;
tspan = [0, 2];
%energy negativ
[t1, a1] = ode45(@(t, y)c_negativ_pos(t, y, 1), tspan , y0, opts); 
[t2, a2] = ode45(@(t, y)c_negativ_neg(t, y, 1), [tspan(2), 4] , max(a1) - y0, opts); 
label1 = plot(t1,a1, 'color', 'b', 'LineWidth', 4);
plot(t2(1:550),a2(1:550), 'color', 'b', 'LineWidth', 4);
%energy negativ
tspan = [0 10];
[t3, a3] = ode45(@c_positiv, tspan, y0, opts);
label2 = plot(t3,a3, 'color', 'r', 'LineWidth', 4);
%energy zero
t4 = linspace(0,10);
label3 = plot(t4, 3/2*t4.^(2/3), 'color', 'g', 'LineWidth', 4);
legend([label2, label3, label1], 'E > 0', 'E = 0 (Escape Velocity)' , 'E < 0', 'Location', 'northwest')
xlabel('Zeit t');
ylabel('Skalenfaktor a');
hold off;

print(f, '-depsc', 'universeWithMatter.eps');
