noofak = 1000;
kmax = 180;

x0 = 0;

plotmin = 0;
plotmax = 8.5;

xmin = x0 + plotmin;
xmax = x0 + plotmax;
scalefactor = 100;

datasize = scalefactor * (xmax - xmin);

A = 1;
B = 0;
C = -1;

a0 = 1; # y(0)
a1start = 0; # y'(0)

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
yformula = sprintf('3;y(x), y(0) = %d, y''(0) = %d;', a0, a1start);

kmaxname = sprintf(', k_max = %d', kmax);
wavetitle = sprintf('Welle%s', kmaxname);
parabolatitle = sprintf('Parabel');
wavewithparabolatitle = sprintf('Welle mit Parabel');

save("./config.dat", "noofak", "kmax", "x0", "xmin", "xmax", "datasize", "scalefactor", "A", "B", "C", "parabolaformula", "yformula", "a0", "a1start", "wavetitle", "parabolatitle", "wavewithparabolatitle");
