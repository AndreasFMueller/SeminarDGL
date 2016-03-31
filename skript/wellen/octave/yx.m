load("./config.dat");
load("./ak.dat");

datasize = scalefactor * (xmax - xmin);

xaxis = linspace(xmin, xmax, datasize + 1);
y = zeros(datasize, 1);
p = zeros(datasize, 1);
for x = (xmin:1 / scalefactor:xmax)
    yx = a0 + a1 * x;
    for k = (2:kmax)
        akminus2 = a(k + 1);
        akminus3 = a(k);
        akminus4 = a(k - 1);
        yx += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * x^k;
    endfor
    p(round((x - xmin) * scalefactor) + 1) = A * x^2 + B * x + C;
    y(round((x - xmin) * scalefactor) + 1) = yx;
endfor

save yx.dat y

set (0, "defaultaxesfontname", "Helvetica")

plot(xaxis, y, yformula);
grid on;
title 'Welle';
print -dpng wave.png;

plot(xaxis, p, parabolaformula, xaxis, y, yformula);
grid on;
title 'Welle mit Parabel';
print -dpng wavewithparabola.png;

plot(xaxis, p, parabolaformula);
grid on;
title 'Parabel';
print -dpng parabola.png
