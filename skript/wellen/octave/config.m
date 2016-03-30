akmax = 1000;
kmax = 225;
xmax = 8;
scalefactor = 100;

A = 1;
B = 0;
C = -1;

parabolaformula = '2;x^2-1  ;';
yformula = '3;y(x), y(0) = 1, y''(0) = 0;';

a0 = 1; # y(0)
a1 = 0; # y'(0)

save("./config.dat", "akmax", "kmax", "xmax", "scalefactor", "A", "B", "C", "parabolaformula", "yformula", "a0", "a1")
