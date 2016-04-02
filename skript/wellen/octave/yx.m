load("./config.dat");
load("./ak.dat");
load("./a0a1.dat");

y = zeros(datasize, 1);
p = zeros(datasize, 1);
for x = (xmin:1 / scalefactor:xmax)
    yx = a0 + a1 * (x - x0);
    for k = (2:kmax)
        akminus2 = a(k + 1);
        akminus3 = a(k);
        akminus4 = a(k - 1);
        yx += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * (x - x0)^k;
    endfor
    p(round((x - xmin) * scalefactor) + 1) = A * x^2 + B * x + C;
    y(round((x - xmin) * scalefactor) + 1) = yx;
endfor

save("yx.dat", "y");
save("parabola.dat", "p");
