options = odeset('Refine', 10,'RelTol',1e-8,'AbsTol',1e-10, 'InitialStep', 1e-10);
[t, a] = ode45(@c_together,[1e-10 20], 0, options);

t1 = t(1:1200);
a1 = a(1:1200);
t_12 = t(1201:1366);
a_12 = a(1201:1366);
t2 = t(1367:1435);
a2 = a(1367:1435);
t_23 = t(1436:1499);
a_23 = a(1436:1499);
t3 = t(1500:end);
a3 = a(1500:end);

linewidth = 2;
text1 = ' Gleichung (16.10)';
text2 = ' Gleichung (16.9)';
text3 = ' Gleichung (16.8)';
f = figure(1);
clf;
hold on;
%fill([0 0 1 1], [0 30 30 0],'r'); 
%fill([2.2 2.2 6 6], [0 30 30 0],'g'); 
%fill([10 10 20 20], [0 30 30 0],'y'); 
%plot(t1, 3/2*t1.^(2/3), 'LineStyle', ':', 'LineWidth', 2, 'color', 'r');
%plot(t2, t2 + 1.97);
%plot(t3, exp(0.07.*t3));
h1 = plot(t1, a1, 'LineWidth', linewidth, 'color', 'r');
h2 = plot(t2, a2, 'LineWidth', linewidth, 'color', 'g');
h3 = plot(t3, a3, 'LineWidth', linewidth, 'color', 'b');
plot(t_12, a_12, t_23, a_23, 'LineWidth', linewidth, 'color', 'k', 'LineStyle', '--');
xlabel('Zeit t', 'Fontsize', 15);
ylabel('Skalenfaktor a', 'Fontsize', 15);
legend([h1, h2, h3], text1, text2, text3,'Location','northwest');
set(gca,'XTickLabel',[]) %Nummern x-Achse ausblenden
set(gca,'YTickLabel',[]) %Nummern y-Achse ausblenden
hold off;

print(f, '-depsc','mathematischFriedmann.eps');
