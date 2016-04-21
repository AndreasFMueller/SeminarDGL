load("./config.dat");
load("./a0a1.dat");

set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");

i = 1;

for b = (brange(1):bstep:brange(2))
    cfg = '2;;';
    runcfg = sprintf('%s -A %d -B %d -C %d -xrange "[%d, %d]" -yautoplot false -yplot "[%d, %d]"', runcfg, A, b, C, xrange(1), xrange(2), plotrange(3), plotrange(4));
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
    title(sprintf('Parabel, a = %d, b = %d, c = %d', A, b, C));
    grid("on");
    print("-dpng", sprintf('bparabola%d.png', i++));
endfor
