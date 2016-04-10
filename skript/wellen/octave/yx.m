load("./config.dat");
load("./ak.dat");
load("./a0a1.dat");

y = zeros(datasize, 1);
p = zeros(datasize, 1);
for x = (xrange(1):1 / scalefactor:xrange(2))
    yx = a0 + a1 * (x - x0);
    for k = (2:kmax)
        akminus2 = a(k + 1);
        akminus3 = a(k);
        akminus4 = a(k - 1);
        yx += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * (x - x0)^k;
    endfor
    p(round((x - xrange(1)) * scalefactor) + 1) = A * x^2 + B * x + C;
    y(round((x - xrange(1)) * scalefactor) + 1) = yx;
endfor

save("yx.dat", "y");
save("parabola.dat", "p");
