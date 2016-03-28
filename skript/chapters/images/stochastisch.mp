%
% stochastisch.mp -- stochastische Prozesse
%
% (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
%
verbatimtex
\documentclass{book}
\usepackage{times}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{amsfonts}
\usepackage{txfonts}
\begin{document}
etex;

input TEX;

TEXPRE("%&latex" & char(10) &
"\documentclass{book}" &
"\usepackage{times}" &
"\usepackage{amsmath}" &
"\usepackage{amssymb}" &
"\usepackage{amsfonts}" &
"\usepackage{txfonts}" &
"\begin{document}");
TEXPOST("\end{document}");

%
% Darstellung des Wiener-Prozesses
%
beginfig(1)

numeric u;
u := 360;

z0 = (0,0);
z1 = (u, 0);

numeric v;
v := 100;

pickup pencircle scaled 1pt;

input path.mp;
z2 = (0, v * minimum);
z3 = (0, v * maximum);

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z2 shifted (0,-10))--(z3 shifted (0,10));

label.top(btex $t$ etex, z1 shifted (10,0));
label.rt(btex $W(t)$ etex, z3 shifted (0,10));

draw p xscaled u yscaled v withcolor red;

endfig;

end
