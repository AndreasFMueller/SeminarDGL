f = figure;
hold off;
for i = 1:4
    subplot(2,2,i);
    clf;
    hold on;
    grid on;
end

E = 0.25:0.25:1.5;
for i = 1:length(E)
    a = linspace(0,1/E(i), 1000);
    f = sqrt(1./a - E(i));  
    col = [0.5 0.5 0.5];
    lineWidth = 2;
    lineStyle = '-';
    %Draw Graphics
    subplot(2,2,1);
    hold on;
    plot(a, f, 'color', col, 'LineWidth', lineWidth, 'LineStyle', lineStyle);
    subplot(2,2,2);
    hold on;
    quiver(E(i),0,0,1/E(i), 'color', 'r', 'LineWidth', lineWidth, 'LineStyle', lineStyle, 'MaxHeadSize', 10);
    subplot(2,2,3);
    hold on;
    plot(a, -f, 'color', col, 'LineWidth', lineWidth, 'LineStyle', lineStyle);
    subplot(2,2,4);
    hold on;
    quiver(E(i), 1/E(i), 0, -1/E(i), 'color', 'b', 'LineWidth', lineWidth, 'LineStyle', lineStyle, 'MaxHeadSize', 10);
end

%Format axis
h1 = subplot(2,2,1);
axis manual;
xlabel('a');
ylabel('f(a)');
axis([0 1/E(1) 0 6]);
h2 = subplot(2,2,3);
axis manual;
axis([0 1/E(1) -6 0]);
xlabel('a');
ylabel('-f(a)');

%draw max size of universe
E = linspace(0,2);
h3 = subplot(2, 2, 2);
axis manual;
axis([0 E(end) 0 6]);
xlabel('E');
ylabel('a');
hold on;
plot(E, 1./E, 'color', 'k', 'LineWidth', 2);
h4 = subplot(2, 2, 4);
hold on;
plot(E, 1./E, 'color', 'k', 'LineWidth', 2);
axis manual;
axis([0 E(end) 0 6]);
xlabel('E');
ylabel('a');

%make eps
bufferFig = figure;
newFig = copyobj(h1, bufferFig);
set(newFig, 'Position', get(0, 'DefaultAxesPosition'));
print(bufferFig, '-depsc', 'phasendiagramm1.eps');
clf(bufferFig);

newFig = copyobj(h2, bufferFig);
set(newFig, 'Position', get(0, 'DefaultAxesPosition'));
print(bufferFig, '-depsc', 'phasendiagramm2.eps');
clf(bufferFig);

newFig = copyobj(h3, bufferFig);
set(newFig, 'Position', get(0, 'DefaultAxesPosition'));
print(bufferFig, '-depsc', 'phasendiagramm3.eps');
clf(bufferFig);

newFig = copyobj(h4, bufferFig);
set(newFig, 'Position', get(0, 'DefaultAxesPosition'));
print(bufferFig, '-depsc', 'phasendiagramm4.eps');


