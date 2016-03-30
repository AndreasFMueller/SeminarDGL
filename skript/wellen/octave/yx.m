load("./config.dat");
load("./ak.dat");

datasize = 2 * scalefactor * xmax;

xaxis = linspace(-xmax, xmax, datasize + 1);
y = zeros(datasize, 1);
p = zeros(datasize, 1);
for x = (-xmax:1 / scalefactor:xmax)
    point = a0 + a1 * x;
    for k = (2:kmax)
        akminus2 = a(k + 1);
        akminus3 = a(k);
        akminus4 = a(k - 1);
        point += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * x^k;
    endfor
    p(round((x + xmax) * scalefactor) + 1) = A * x^2 + B * x + C;
    y(round((x + xmax) * scalefactor) + 1) = point;
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
