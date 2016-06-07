y0 = zeros(2,1);
x = (0:10) * deltax;
lsode("f", y0, x)
