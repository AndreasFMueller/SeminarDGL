load("./config.dat");
load("./ak.dat");

a0 = a0start + a1start * x0;
for k = (2:kmax)
    akminus2 = a(k + 1);
    akminus3 = a(k);
    akminus4 = a(k - 1);
    a0 += -1 / (k * (k - 1)) * (A * akminus4 + B * akminus3 + C * akminus2) * x0^k;
endfor

a1 = a1start;
for k = (1:kmax-1)
    akminus3 = a(k);
    akminus2 = a(k + 1);
    akminus1 = a(k + 2);
    a1 += -1 / k * (A * akminus3 + B * akminus2 + C * akminus1) * x0^k;
endfor

save("./a0a1.dat", "a0", "a1");
system("octave ak.m -a0a1 ./a0a1.dat");
