load("./config.dat");

a = zeros(noofak, 1);

a(1) = 0; # a_{-2}
a(2) = 0; # a_{-1}
a(3) = a0; # a_0
a(4) = a1; # a_1

for k = (2:noofak-2)
    akminus2 = a(k + 1);
    akminus3 = a(k);
    akminus4 = a(k - 1);
    ak = -1 / (k * (k-1)) * (A * akminus4 + B * akminus3 + C * akminus2);
    a(k + 3) = ak;
endfor

save("./ak.dat", "a");
