load("./config.dat");
load("./yx.dat");
load("./parabola.dat");

xaxis = linspace(xmin, xmax, datasize + 1);

set (0, "defaultaxesfontname", "Helvetica")

plot(xaxis, y, yformula);
grid("on");
title(wavetitle);
print("-dpng", "wave.png");

plot(xaxis, p, parabolaformula, xaxis, y, yformula);
grid("on");
title(wavewithparabolatitle);
print("-dpng", "wavewithparabola.png");

plot(xaxis, p, parabolaformula);
grid("on");
title(parabolatitle);
print("-dpng", "parabola.png");
