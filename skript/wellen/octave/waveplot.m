load("./config.dat");
load("./yx.dat");
load("./parabola.dat");

xaxis = linspace(xrange(1), xrange(2), datasize + 1);

set (0, "defaultaxesfontname", "Helvetica")
figure("visible","off");
plot(xaxis, y, yformula);
axis([0, 1, -1, 1]);
axis("auto x");
axis("auto y");
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
