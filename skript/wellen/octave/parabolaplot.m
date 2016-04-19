load("./config.dat");
load("./a0a1.dat");

set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");

i = 1;

for a = (arange(1):astep:arange(2))
    cfg = '2;;';
    runcfg = sprintf('%s -A %d -B %d -C %d -yautoplot false -yplot "[%d, %d]"', runcfg, a, B, C, plotrange(3), plotrange(4));
    system(runcfg);
    system(runak);
    system(runa0a1);
    system(runyx);
    load("./yx.dat");
    plot(xaxis, p, cfg);
    axis(plotrange);
    if (autox)
        axis("auto x");
    endif
    if (autoy)
        axis("auto y");
    endif
    title(sprintf('Parabel, a = %d, b = %d, c = %d', a, B, C));
    print("-dpng", sprintf('parabola%d.png', i++));
endfor
