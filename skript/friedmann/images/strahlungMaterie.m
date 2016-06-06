t1 = linspace(0,1);
t2 = linspace(1,1.5);

f = figure(1);
clf;
hold on;
axis square;
h1 = plot(t1, 3/2*t1.^(2/3), 'LineWidth', 4, 'color', 'b');
h2 = plot(t1, sqrt(2*t1), 'LineWidth', 4, 'color', 'g');

plot(t2, 3/2*t2.^(2/3), 'LineWidth', 4, 'color', 'k', 'LineStyle', '--');
plot(t2, sqrt(2*t2), 'LineWidth', 4, 'color', 'k',  'LineStyle', '--');

hold off;

xlabel('Zeit t', 'FontSize', 15);
ylabel('Skalenfaktor a', 'FontSize', 15);
legend([h1,h2], 'Gewöhnliche Materie dominiert', 'Strahlung dominiert', 'Location', 'northwest');

print(f, '-depsc','strahlungMaterie.eps');
