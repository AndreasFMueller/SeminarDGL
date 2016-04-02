load("./config.dat");
load("./ak.dat");

y5 = a0start + a1start * 5;
for k = (2:kmax)
    akminus2 = a(k + 1);
    akminus3 = a(k);
    akminus4 = a(k - 1);
    y5 += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * 5^k;
endfor

ys5 = a1start;
for k = (1:kmax-1)
    akminus3 = a(k);
    akminus2 = a(k + 1);
    akminus1 = a(k + 2);
    ys5 += -1 / k * (A * akminus3 + B * akminus2 + C * akminus1) * 5^k;
endfor

a0 = a0start;
a1 = a1start;

save("./a0a1.dat", "a1", "a0", "y5", "ys5");
