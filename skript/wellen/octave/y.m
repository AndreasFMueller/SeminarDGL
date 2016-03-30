xmax = 8;
scale = 100;
maxplot = 8;

load("./ak.dat");

a0 = a(3);
a1 = a(4);

limit = round(2 * maxplot * scale);

datasize = 2 * scale * xmax;

y = zeros(datasize, 1);
p = zeros(datasize, 1);
for x = (-xmax:1 / scale:xmax)
    point = a0 + a1 * x;
    for k = (2:225)
        akminus2 = a(k + 1);
        akminus3 = a(k);
        akminus4 = a(k - 1);
        point += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * x^k;
    endfor
    p(round((x + xmax) * scale) + 1) = A * x^2 + B * x + C;
    y(round((x + xmax) * scale) + 1) = point;
endfor

save y.dat y

y = y(1:limit);
p = p(1:limit);

set (0, "defaultaxesfontname", "Helvetica")
hold on;

plot(y);
print -djpg welle.jpg;

plot(p);
print -djpg wellewithparabel.jpg;

hold off;

plot(p);
print -djpg parabel.jpg
