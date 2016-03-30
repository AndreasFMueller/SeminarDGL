n = 1000;

A = 1;
B = 0;
C = -1;
a = zeros(n, 1);

a(1) = 0; # a_{-2}
a(2) = 0; # a_{-1}
a(3) = 1; # a_0
a(4) = 0; # a_1

a0 = a(3);
a1 = a(4);

for k = (2:n-2)
    akminus2 = a(k + 1);
    akminus3 = a(k);
    akminus4 = a(k - 1);
    ak = -1 / (k * (k-1)) * (A * akminus4 + B * akminus3 + C * akminus2);
    a(k + 3) = ak;
endfor

save("./ak.dat", "a", "A", "B", "C");
