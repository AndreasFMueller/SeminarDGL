noofak = 180;
kmax = 180;

x0 = 0;

plotmin = -4;
plotmax = 6;

xmin = x0 + plotmin;
xmax = x0 + plotmax;
scalefactor = 100;

datasize = scalefactor * (xmax - xmin);

A = 0;
B = 1;
C = -1;

a0start = 1.1; # y(0)
a1start = 1; # y'(0)

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
yformula = sprintf('3;y(x), y(0) = %d, y''(0) = %d;', a0start, a1start);

wavetitle = sprintf('Welle, a=%d, b=%d, c=%d', A, B, C);
parabolatitle = sprintf('Parabel');
wavewithparabolatitle = sprintf('Welle mit Parabel');

save("./config.dat", "noofak", "kmax", "x0", "xmin", "xmax", "datasize", "scalefactor", "A", "B", "C", "parabolaformula", "yformula", "a0start", "a1start", "wavetitle", "parabolatitle", "wavewithparabolatitle");
