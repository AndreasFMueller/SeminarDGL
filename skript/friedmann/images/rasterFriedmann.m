clear;
hFig = figure(1);
set(hFig, 'Position', [0 0 1000 1000])
x = -6:1:6;
y = -6:1:6;
scale = 1.5;
lin_x = zeros([length(x), 4]);
lin_y = zeros([length(y), 4]);
galaxieA = [ 1  2];
galaxieB = [-2 -2];
galaxieC = [-3 0];
for i = 1:length(y)-1
    lin_y(i,1) = x(1);
    lin_y(i,2) = x(end);
    lin_y(i,3) = x(i);
    lin_y(i,4) = y(i);
end

for i = 1:length(x)-1
    lin_x(i,1) = x(i);
    lin_x(i,2) = x(i);
    lin_x(i,3) = y(1);
    lin_x(i,4) = y(end);
end

%Plot1
subplot(1,2,1);
axis([x(1) x(end) y(1) y(end)]);
axis square;
hold on;
for j = 2:length(x)-1
    line([lin_x(j,1), lin_x(j,2)], [lin_x(j,3), lin_x(j,4)], 'LineStyle', ':', 'color', 'k');
    line([lin_y(j,1), lin_y(j,2)], [lin_y(j,3), lin_y(j,4)], 'LineStyle', ':', 'color', 'k');
end
line([x(1) x(end)], [0 0], 'LineWidth', 0.5, 'color', 'k');
line([0 0], [y(1) y(end)], 'LineWidth', 0.5, 'color', 'k');
scatter(0,0,20,'k');
scatter(galaxieA(1), galaxieA(2), 150, 'fill', 'r');
scatter(galaxieB(1), galaxieB(2), 300, 'fill', 'b');
scatter(galaxieC(1), galaxieC(2), 500, 'fill', 'g');
line([galaxieA(1) galaxieB(1)], [galaxieA(2) galaxieB(2)], 'LineWidth', 2, 'Color', 'k', 'LineStyle', '--');

x_arrow = [1 2];
y_arrow = [-4.5 -4.5];
line(x_arrow, y_arrow, 'Color', 'k','LineWidth', 2);
text(1.3, y_arrow(1) + 0.5, 'a(t_0) = a', 'FontSize', 15);
hold off;
axis off;

%Plot2

subplot(1,2,2);
axis([x(1) x(end) y(1) y(end)]);
axis square;
hold on;

for j = 4:length(x)-3
    line(scale*[lin_x(j,1), lin_x(j,2)], scale*[lin_x(j,3), lin_x(j,4)], 'LineStyle', ':', 'color', 'k');
    line(scale*[lin_y(j,1), lin_y(j,2)], scale*[lin_y(j,3), lin_y(j,4)], 'LineStyle', ':', 'color', 'k');
end

line([x(1) x(end)], [0 0], 'LineWidth', 0.5, 'color', 'k');
line([0 0], [y(1) y(end)], 'LineWidth', 0.5, 'color', 'k');

scatter(0,0,20,'k');
scatter(scale*galaxieA(1), scale*galaxieA(2), 150, 'fill', 'r');
scatter(scale*galaxieB(1), scale*galaxieB(2), 300, 'fill', 'b');
scatter(scale*galaxieC(1), scale*galaxieC(2), 500, 'fill', 'g');
line(scale*[galaxieA(1) galaxieB(1)], scale*[galaxieA(2) galaxieB(2)], 'LineWidth', 2, 'Color', 'k', 'LineStyle', '--');

line(scale*x_arrow, y_arrow, 'Color', 'k','LineWidth', 2);
text(2.1, y_arrow(1) + 0.5, 'a(t_1) = 1.5a', 'FontSize', 15);

hold off;  
axis off;

print(hFig, '-depsc','rasterFriedmann.eps');