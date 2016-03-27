%
% airy.mp -- Kurven zur Berechnung der Airy-Funktionen
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

beginfig(1)

numeric u;
u := 130;

z0 = ( 0,  0);
z1 = (-u,  0);
z2 = ( u,  0);
z3 = ( 0, -u);
z4 = ( 0,  u);

z5 = (0.5,  sqrt(3) / 2) * u;
z6 = (0.5, -sqrt(3) / 2) * u;

z7 = (sqrt(3) / 2,  0.5) * u;
z8 = (sqrt(3) / 2, -0.5) * u;

fill z0--(3 * z7)--(3 * z8)--cycle withcolor 0.9;
fill (z0--(3 * z7)--(3 * z8)--cycle) rotated 120 withcolor 0.9;
fill (z0--(3 * z7)--(3 * z8)--cycle) rotated 240 withcolor 0.9;

pickup pencircle scaled 1.5pt;

path p;
p := (z2 scaled 2 rotated 120){dir -60}.. tension 0.8 ..{dir 0}(z2 scaled 2);

draw p;
draw p rotated 120;
draw p rotated 240;

z10 = (p rotated 120) intersectionpoint (z1--z2);

label.ulft(btex $\gamma_0$ etex, z10);
label.lrt(btex $\gamma_-$ etex, z10 rotated 120);
label.urt(btex $\gamma_+$ etex, z10 rotated 240);

clip currentpicture to (z2 shifted z3)--(z2 shifted z4)--(z1 shifted z4)--(z1 shifted z3)--cycle;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.top(btex $\operatorname{Re}$ etex, z2 shifted (10,0));
label.rt(btex $\operatorname{Im}$ etex, z4 shifted (0,10));

endfig;

end
