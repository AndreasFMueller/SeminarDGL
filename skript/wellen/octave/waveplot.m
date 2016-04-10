load("./config.dat");
load("./a0a1.dat");
load("./yx.dat");
load("./parabola.dat");

xaxis = linspace(xrange(1), xrange(2), datasize + 1);

set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");

runak = 'octave ak.m';
runa0a1 = 'octave a0a1.m';
runyx = 'octave yx.m';

if (krangeplot)
    hold("on");
    klinecolor = linecolor;
    for k = (krange(1):kstep:krange(2))
        cfg = sprintf('%d;;', mod(klinecolor++, 6));
	runcfg = sprintf('octave config.m -kmax %d -xrange "[%d, %d]" -a0 %d -a1 %d', k, xrange(1), xrange(2), a0, a1);
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
    krangetitle = sprintf('Welle, kmin = %d, kmax = %d', krange(1), krange(2));
    title(krangetitle);
    print("-dpng", "krangewave.png");
    hold("off");
endif

plot(xaxis, y, yformula);
axis(plotrange);
if (autoy)
    axis("auto y");
endif
grid("on");
title(wavetitle);
print("-dpng", "wave.png");

plot(xaxis, p, parabolaformula, xaxis, y, yformula, [x1, x1], [0, x1val], '1;;', [x2, x2], [0, x2val], '1;;', [xrange(1), xrange(2)], [a0, a0], '5;;');
axis(plotrange);
if (autox)
    axis("auto x");
endif
if (autoy)
    axis("auto y");
endif
grid("on");
title(wavewithparabolatitle);
print("-dpng", "wavewithparabola.png");

plot(xaxis, p, parabolaformula);
axis(plotrange)
if (autox)
    axis("auto x");
endif
if (autoy)
    axis("auto y");
endif
grid("on");
title(parabolatitle);
print("-dpng", "parabola.png");
