akmax = 1000;
kmax = 300;

xmin = 0;
xmax = 8;
scalefactor = 100;

A = 1;
B = 0;
C = -1;

a0 = 1; # y(0)
a1 = 0; # y'(0)

parabolaformula = '';

signb = '+';
signc = '+';

if (B < 0)
    signb = '';
endif

if (C < 0)
    signc = '';
endif

afactor = '';
bfactor = '';
cfactor = '';

if (A != 0)
    if (A == 1)
        afactor = 'x^2';
    else
        afactor = sprintf('%dx^2', A);
    endif
endif

if (B != 0)
    if (B == 1)
        bfactor = 'x';
    else
        bfactor = sprintf('%s%dx', signb, B);
    endif
endif

if (C != 0)
    cfactor = sprintf('%s%d', signc, C);
endif

parabolaformula = sprintf('2;%s%s%s   ;', afactor, bfactor, cfactor);
yformula = sprintf('3;y(x), y(0) = %d, y''(0) = %d;', a0, a1);

save("./config.dat", "akmax", "kmax", "xmin", "xmax", "scalefactor", "A", "B", "C", "parabolaformula", "yformula", "a0", "a1");
