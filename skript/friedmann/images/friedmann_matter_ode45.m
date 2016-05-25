[t1,a1] = ode45(@c_positiv,[0.001 5], 0);
[t2,a2] = ode45(@c_zero,[0.001 5], 0);
[t3,a3] = ode45(@c_negativ,[0.01 1], 0);

f = figure;

for i = 1:length(t3)
    t4(length(t3) - i + 1) = 2*t3(length(t3)) - t3(i);
end

for i = 1:length(a3)
    a4(i) = a3(length(a3)- i + 1);
end

clf; 
hold on;
l1 = plot(t1, a1, 'color', 'b', 'LineWidth', 4);
l2 = plot(t2, a2, 'color', 'g', 'LineWidth', 4);
l3 = plot(t3, a3, t4, a4, 'color', 'r', 'LineWidth', 4);
%l4 = plot(t2, 3/2 * t2.^(2/3), 'LineStyle', '--', 'color', 'g'); %funktion
%der aufgelösten DGL für c = 0
%l5 = plot(t1, t1 + 2, 'color', 'b', 'LineStyle', '--'); %Lösung der Dgl
%wenn a gross, zweiter Term dominiert
hold off;

legend([l1, l2 , l3(1)], ' c > 0', ' c = 0', ' c < 0', 'Location','northwest');
title('Expansion of the Universe without radiation and dark matter')

set(gca,'XTickLabel',[]) %Nummern x-Achse ausblenden
set(gca,'YTickLabel',[]) %Nummern y-Achse ausblenden

print(f, '-dpdf','friedmann_ordinary_matter.pdf');


