load("./config.dat");
load("./ak.dat");
load("./a0a1.dat");

function yx = f(x, a, a0, a1, A, B, C, kmax)
    yx = a0 + a1 * x;
    for k = (2:kmax)
        akminus2 = a(k + 1);
        akminus3 = a(k);
        akminus4 = a(k - 1);
        yx += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * x^k;
    endfor
endfunction

y = zeros(datasize, 1);
p = zeros(datasize, 1);
for x = (xrange(1):1 / scalefactor:xrange(2))
    arrayposition = round((x - xrange(1)) * scalefactor) + 1;
    y(arrayposition) = f(x - x0, a, a0, a1, A, B, C, kmax);
    p(arrayposition) = A * x^2 + B * x + C;
endfor

x1val = f(x1, a, a0, a1, A, B, C, kmax);
x2val = f(x2, a, a0, a1, A, B, C, kmax);

xaxis = linspace(xrange(1), xrange(2), datasize + 1);

save("yx.dat", "y", "x1val", "x2val", "p", "xaxis");
