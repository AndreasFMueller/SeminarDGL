##
# Octave run
##

runcfg = 'octave config.m';
runak = 'octave ak.m';
runa0a1 = 'octave a0a1.m';
runyx = 'octave yx.m';
runkrangeplot = 'octave krangeplot.m';
runwaveplot = 'octave waveplot.m';

##
# Plot settings
##

plotwave = true;
plotkrange = false;

waveplot = true;
parabolazeroesplot = true;
parabolaplot = true;
a0heightplot = false;

##
# Config variables
##

kmax = 180;

krange = [kmax, kmax];
kstep = 1;

x0 = 0;

xrange = [-8, 8];

scalefactor = 100;

A = 1;
B = 0;
C = -1;

arange = [A, A];
brange = [B, B];
crange = [C, C];

astep = 1;
bstep = 1;
cstep = 1;

a0start = 1; # y(0)
a1start = 0; # y'(0)

a0range = [a0start, a0start];
a1range = [a1start, a1start];

a0step = 1;
a1step = 1;

plotrange = [-1, 1, -1, 1];

autox = true;
autoy = true;

linecolor = 3;

arglist = argv();

for i = (1:nargin)
    switch(arglist(i){1})
        case "-a0"
            a0start = str2num(arglist(++i){1});
        case "-a1"
            a1start = str2num(arglist(++i){1});
        case "-A"
            A = str2num(arglist(++i){1});
        case "-B"
            B = str2num(arglist(++i){1});
        case "-C"
            C = str2num(arglist(++i){1});
        case "-x0"
            x0 = str2num(arglist(++i){1});
        case "-xrange"
            xrange = str2num(arglist(++i){1});
        case "-xplot"
            plotrange(1) = str2num(arglist(++i){1})(1);
            plotrange(2) = str2num(arglist(i){1})(2);
        case "-xautoplot"
            autox = str2num(arglist(++i){1});
        case "-yplot"
            plotrange(3) = str2num(arglist(++i){1})(1);
            plotrange(4) = str2num(arglist(i){1})(2);
        case "-yautoplot"
            autoy = str2num(arglist(++i){1}); 
        case "-scalefactor"
            scalefactor = str2num(arglist(++i){1});
        case "-kmax"
            kmax = str2num(arglist(++i){1});
        case "-arange"
            arange = str2num(arglist(++i){1});
            astep = str2num(arglist(++i){1});
        case "-brange"
            brange = str2num(arglist(++i){1});
            bstep = str2num(arglist(++i){1});
        case "-crange"
            crange = str2num(arglist(++i){1});
            cstep = str2num(arglist(++i){1});
        case "-a0range"
            a0range = str2num(arglist(++i){1});
            a0step = str2num(arglist(++i){1});
        case "-a1range"
            a1range = str2num(arglist(++i){1});
            a1step = str2num(arglist(++i){1});
        case "-krange"
            krange = str2num(arglist(++i){1});
            kstep = str2num(arglist(++i){1});
        case "-krangeplot"
            krangeplot = str2num(arglist(++i){1});
    endswitch
endfor

xrange += x0;

datasize = scalefactor * (xrange(2) - xrange(1));

if (A != 0)
    x1 = real((-B + sqrt(B^2 - 4 * A * C)) / (2 * A));
    x2 = real((-B - sqrt(B^2 - 4 * A * C)) / (2 * A));
elseif (B != 0)
    x1 = -C / B;
    x2 = x1;
else
    x1 = 0;
    x2 = 0;
endif

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

if (C != 0 && (A != 0 || B != 0))
    cfactor = sprintf('%s%d', signc, C);
endif

parabolaformula = sprintf('2;%s%s%s   ;', afactor, bfactor, cfactor);
yformula = sprintf('3;y(x), y(0) = %d, y''(0) = %d;', a0start, a1start);

wavetitle = sprintf('Welle, a=%d, b=%d, c=%d', A, B, C);
parabolatitle = sprintf('Parabel');
wavewithparabolatitle = sprintf('Welle mit Parabel');

save("./config.dat", "kmax", "x0", "x1", "x2", "xrange", "datasize", "plotrange", 
"autox", "autoy", "scalefactor", "A", "arange", "astep", "B", "brange", "bstep", 
"C", "crange", "cstep", "a0start", "a0range", "a0step", "a1start", "a1range", "a1step", 
"krange", "kstep", "plotkrange", "linecolor", 
"plotwave", "parabolaplot", "waveplot", "parabolazeroesplot", "a0heightplot", 
"runcfg", "runak", "runa0a1", "runyx", "runkrangeplot", "runwaveplot",
"parabolaformula", "yformula", "wavetitle", "parabolatitle", "wavewithparabolatitle");
