load("./config.dat");
load("./a0a1.dat");
load("./yx.dat");
load("./loopdata.dat");
set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");
hold("on");
plot(xaxis, p, '2;;');
plot(xaxis, y, '3;;');
plot([x1, x1], [0, x1val], '1;;');
plot([x2, x2], [0, x2val], '1;;');
axis(plotrange);
if (autox)
    axis("auto x");
endif
if (autoy)
    axis("auto y");
endif
title(sprintf('Welle, a = %d, b = %d, c = %d', a, B, C));
grid("on");
print("-dpng", sprintf('awave%d.png', i));
