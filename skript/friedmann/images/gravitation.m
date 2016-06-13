xmin = -2;
xmax = 2;
ymin = -2;
ymax = 2;
M_x = 0;
M_y = 0;
size_M = 500;
m_x = 1;
m_y = 0.8;
size_m = 100;
f = figure(1);
hold off;
plot(0,0);
hold on;
axis equal;
axis([xmin xmax ymin ymax]);
viscircles([0 0], sqrt(m_x^2 + m_y^2), 'LineStyle', '--', 'LineWidth', 0.5);
scatter(M_x,M_y, size_M, 'fill'); %Mass M
text(M_x - 0.3, M_y - 0.3, 'M', 'Fontsize', 20, 'color', 'g');
scatter(m_x,m_y, size_m, 'fill', 'b') %Mass m
text(m_x + 0.1, m_y, 'm', 'Fontsize', 20, 'color', 'b');
line([M_x m_x],[M_y m_y], 'color', 'r'); %Distanz D
text((m_x - M_x)/2 - 0.2 , (m_x - M_x)/2 + 0.1, 'D', 'Color', 'r', 'Fontsize', 20);
line([xmin xmax], [0 0], 'LineWidth', 1, 'LineStyle', '-', 'color', 'k');
line([0 0], [ymin ymax], 'LineWidth', 1, 'LineStyle', '-', 'color', 'k')
quiver(m_x, m_y, (M_x - m_x)/3, (M_y - m_y)/3, 'LineWidth', 1.5, 'Color', 'k', 'MaxHeadSize', 5 );
text((m_x - M_x)*2/3 + 0.2, (m_y - M_y)*2/3 - 0.1, 'F_G', 'Fontsize', 20);
quiver(m_x + 0.1, m_y + 0.08, m_x * 0.5, m_y * 0.5, 'LineWidth', 1.5, 'Color', 'b', 'MaxHeadSize', 5, 'LineStyle', '-' );
text(m_x + 0.2, m_y + 0.4, 'v', 'Fontsize', 20, 'Color', 'b');
set(gcf,'color','w');
grid on;
set(gca,'XTickLabel',[]) %Nummer x-Achse ausblenden
set(gca,'YTickLabel',[]) %Nummern y-Achse ausblenden
axis on;

print(f, '-depsc','gravitation.eps')