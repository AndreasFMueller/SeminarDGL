A = 1;
B = 0;
C = -1;
a = zeros(30, 1);

a(1) = 0; # a_{-2}
a(2) = 0; # a_{-1}
a(3) = 1; # a_0
a(4) = 0; # a_1

a0 = a(3);
a1 = a(4);

for k = (2:28)
    akminus2 = a(k + 1);
    akminus3 = a(k);
    akminus4 = a(k - 1);
    ak = -1 / (k * (k-1))  * (A * akminus4 + B * akminus3 + C * akminus2);
    a(k + 3) = ak;
endfor

save ak.dat a

xmax = 10;
scale = 100;
maxplot = 4;

limit = round(maxplot * scale);

y = zeros(scale * xmax, 1);
p = zeros(scale * xmax, 1);
for x = (0:1 / scale:xmax)
    point = a0 + a1 * x;
    for k = (2:30)
        akminus2 = a(k + 1);
        akminus3 = a(k);
        akminus4 = a(k - 1);
        point -= 1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * x^k;
    endfor
    p(round(x * scale) + 1) = A * x^2 + B * x + C;
    y(round(x * scale) + 1) = point;
endfor

save y.dat y

y = y(1:limit);
p = p(1:limit);

set (0, "defaultaxesfontname", "Helvetica")
hold on;
plot(y);
print -djpg welle.jpg;

plot(p);
print -djpg parabel.jpg;
