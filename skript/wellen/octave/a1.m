load("./config.dat");
load("./ak.dat");

a1 = a1start;

for k = (2:kmax)
    a1 += a(k) * x0^k;
endfor

save("./a1.dat", "a1");
