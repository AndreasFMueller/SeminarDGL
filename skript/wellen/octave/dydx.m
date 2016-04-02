load("./config.dat");
load("./ak.dat");

dydx = 0;

for k = (2:akmax)
    dydx += a(k) * x0^k;
endfor

save("./dydx0.dat", "dydx");
