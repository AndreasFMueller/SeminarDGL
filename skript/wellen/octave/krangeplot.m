load("./config.dat");
load("./a0a1.dat");

set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");

hold("on");
klinecolor = linecolor;
for k = (krange(1):kstep:krange(2))
    cfg = sprintf('%d;;', mod(klinecolor++, 6));
    runcfg = sprintf('%s -kmax %d -xrange "[%d, %d]" -a0 %d -a1 %d -A %d -B %d -C %d', runcfg, k, xrange(1), xrange(2), a0, a1, A, B, C);
    system(runcfg);
    system(runak);
    system(runa0a1);
    system(runyx);
    load("./yx.dat");
    plot(xaxis, y, cfg);
endfor
axis(plotrange);
if (autox)
    axis("auto x");
endif
if (autoy)
    axis("auto y");
endif
krangetitle = sprintf('Welle, k_min = %d, k_max = %d, Schrittlaenge: %d', krange(1), krange(2), kstep);
title(krangetitle);
print("-dpng", "krangewave.png");
