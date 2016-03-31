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
hold on;
plot(xaxis, y, yformula);
print -dpng wave.png;

plot(xaxis, p, parabolaformula);
print -dpng wavewithparabola.png;

hold off;
plot(xaxis, p, parabolaformula);
print -dpng parabola.png
