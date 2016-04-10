load("./config.dat");
load("./yx.dat");
load("./parabola.dat");

xaxis = linspace(xrange(1), xrange(2), datasize + 1);

set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");
plot(xaxis, y, yformula);
axis(plotrange);
if (autox)
    axis("auto x");
endif
if (autoy)
    axis("auto y");
endif
grid("on");
title(wavetitle);
print("-dpng", "wave.png");

plot(xaxis, p, parabolaformula, xaxis, y, yformula, [x1, x1], [0, x1val], '1;;', [x2, x2], [0, x2val], '1;;');
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
