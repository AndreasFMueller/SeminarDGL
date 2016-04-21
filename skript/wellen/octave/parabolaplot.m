load("./config.dat");
load("./a0a1.dat");

i = 1;

for a = (arange(1):astep:arange(2))
    runcfg = sprintf('%s -A %d -B %d -C %d -xrange "[%d, %d]" -xplot "[%d, %d]" -xautoplot %d -yautoplot %d -yplot "[%d, %d]"', runcfg, a, B, C, xrange(1), xrange(2), plotrange(1), plotrange(2), autox, autoy, plotrange(3), plotrange(4));
    system(runcfg);
    load("./config.dat");
    system(runak);
    system(runa0a1);
    load("./a0a1.dat");
    system(runyx);
    load("./yx.dat");
    save("./loopdata.dat", "i", "a");
    ++i;
    system('octave awaveplot.m');
endfor
