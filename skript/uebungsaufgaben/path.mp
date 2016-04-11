%
% path.mp -- Bilder zu Wegintegral
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

%
% Pfad zur Berechnung des unbestimmten Integrals von 1/(t^2+1)
%
beginfig(1)

numeric u;
u = 20;
numeric v;
v = 5;

z0 = (     0,      0);
z1 = (-v * u,      0);
z2 = ( v * u,      0);
z3 = (     0, -2 * u);
z4 = (     0,  v * u);

z5 = (0,  u);
z6 = (0, -u);

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.top(btex Re etex, z2 shifted (10,0));
label.rt(btex Im etex, z4 shifted (0,10));

pickup pencircle scaled 4pt;
draw z5;
draw z6;

pickup pencircle scaled 3pt;
draw z5 withcolor white;
draw z6 withcolor white;

label.urt(btex $i$ etex, z5);
label.lrt(btex $-i$ etex, z6);

path p;
p := z2;
for a = 2 step 2 until 180:
	p := p--(z2 rotated a);
endfor;
p := p--cycle;

pickup pencircle scaled 1.5pt;
draw p withcolor red;

label.bot(btex $R$ etex, z2);
label.bot(btex $-R$ etex, z1);

label(btex $\mathbb C$ etex, z1 shifted z4);

label.top(btex $\gamma_1$ etex, 0.5[z0,z2]) withcolor red;
label.urt(btex $\gamma_2$ etex, z2 rotated 45) withcolor red;

endfig;

end
