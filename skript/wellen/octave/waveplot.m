load("./config.dat");
load("./a0a1.dat");
load("./yx.dat");

set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");

hold("on");
if (parabolaplot)
    plot(xaxis, p, parabolaformula);
endif

if (waveplot)
    plot(xaxis, y, yformula);
endif

if (parabolazerosplot)
    plot([x1, x1], [0, x1val], '1;;');
    plot([x2, x2], [0, x2val], '1;;');
endif

if (a0heightplot)
    plot([xrange(1), xrange(2)], [a0, a0], '5;;');
endif

axis(plotrange);
if (autox)
    axis("auto x");
endif
if (autoy)
    axis("auto y");
endif
grid("on");
title(wavewithparabolatitle);
print("-dpng", sprintf('%s.png', filename));
