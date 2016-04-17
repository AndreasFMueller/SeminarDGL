%
% bifurkation.mp -- Phasenportraits fuer verschiedene Bifurkationen
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
% Sattel-Knoten-Bifurkation
%
beginfig(1)

numeric u;
u := 90;

z0 = (     0,            0);
z1 = (-2 * u,            0);
z2 = ( 2 * u,            0);
z3 = (     0, -sqrt(2) * u);
z4 = (     0,  sqrt(2) * u);

numeric stepwidth;
stepwidth = 0.02;
path curve;
curve = (-2, -sqrt(2));
for v = -sqrt(2) + stepwidth step stepwidth until sqrt(2) - stepwidth:
	curve := curve--(-v * v, v);
endfor;
curve := curve--(-2, sqrt(2));

fill curve--cycle scaled u withcolor (0.95,0.95,1);
fill curve--(2,sqrt(2))--(2,-sqrt(2))--cycle scaled u withcolor (1,0.95,0.95);

pickup pencircle scaled 2pt;

for a = -1.9 step 0.2 until -0.1:
	show a;
	path d;
	d := (curve intersectionpoint ((a,2)--(a,0)))
		--(((a,0)--(a,-2)) intersectionpoint curve);
	drawarrow ((point 0 of d)--(point 0.25 of d)) scaled u withcolor blue;
	draw ((point 0.25 of d)--(point 0.5 of d)) scaled u withcolor blue;
	drawarrow ((point 0.5 of d)--(point 0.75 of d)) scaled u withcolor blue;
	draw ((point 0.75 of d)--(point 1 of d)) scaled u withcolor blue;
	path q;
	q := (point 0 of d)--(a,sqrt(2));
	drawarrow ((point 0 of q)--(point 0.5 of q)) scaled u withcolor red;
	draw ((point 0.5 of q)--(point 1 of q)) scaled u withcolor red;
	q := (point 1 of d)--(a,-sqrt(2));
	drawarrow ((point 1 of q)--(point 0.5 of q)) scaled u withcolor red;
	draw ((point 0.5 of q)--(point 0 of q)) scaled u withcolor red;
endfor;

for a = 0.1 step 0.2 until 2:
	path d;
	d := (a,-sqrt(2))--(a,sqrt(2));
	drawarrow ((point 0 of d)--(point 0.25 of d)) scaled u withcolor red;
	draw ((point 0.25 of d)--(point 0.5 of d)) scaled u withcolor red;
	drawarrow ((point 0.5 of d)--(point 0.75 of d)) scaled u withcolor red;
	draw ((point 0.75 of d)--(point 1 of d)) scaled u withcolor red;
endfor;

pickup pencircle scaled 1.5pt;
draw curve scaled u;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.top(btex $b$ etex, z2 shifted (10,0));
label.rt(btex $y$ etex, z4 shifted (0,10));

endfig;

%
% Gabel-Bifurkation
%
beginfig(2)

numeric u;
u := 90;

z0 = (     0,            0);
z1 = (-2 * u,            0);
z2 = ( 2 * u,            0);
z3 = (     0, -sqrt(2) * u);
z4 = (     0,  sqrt(2) * u);

numeric stepwidth;
stepwidth = 0.02;
path oben;
oben := z0;
path unten;
unten := z0;
for v = stepwidth step stepwidth until sqrt(2):
	oben := oben--(v * v, v);
	unten := unten--(v * v, -v);
endfor;
oben := oben--(2, sqrt(2));
unten := unten--(2, -sqrt(2));

fill oben--(2,0)--cycle scaled u withcolor (0.95,0.95,1);
fill unten--(2,0)--cycle scaled u withcolor (1,0.95,0.95);
fill (-2,0)--oben--(-2,sqrt(2))--cycle scaled u withcolor (1,0.95,0.95);
fill (-2,-sqrt(2))--(-2,0)--unten--cycle scaled u withcolor (0.95,0.95,1);

pickup pencircle xscaled 2pt yscaled 0.1pt;

z5 = (0,  0.5 * sqrt(2) * u);
z6 = (0, -0.5 * sqrt(2) * u);

for a = -1.9 step 0.2 until 0:
	drawarrow (z0 shifted (a * u,0))--(z5 shifted (a * u,0)) withcolor red;
	draw (z5 shifted (a * u,0))--(z4 shifted (a * u,0)) withcolor red;
	draw (z6 shifted (a * u,0))--(z3 shifted (a * u, 0)) withcolor blue;
	drawarrow (z0 shifted (a * u, 0))--(z6 shifted (a * u, 0)) withcolor blue;
endfor;

for a = 0.1 step 0.2 until 2:
	path q;
	q := (a * u,0)--(a*u, sqrt(2) * u);
	path p;
	p := (point 0 of q)--(oben scaled u intersectionpoint q);
	drawarrow (point 1 of p)--(point 0.5 of p) withcolor blue;
	draw (point 0.5 of p)--(point 0 of p) withcolor blue;
	p := (oben scaled u intersectionpoint q)--(point 1 of q);
	drawarrow (point 0 of p)--(point 0.5 of p) withcolor red;
	draw (point 0.5 of p)--(point 1 of p) withcolor red;
	q := (a * u,0)--(a*u, -sqrt(2) * u);
	p := (point 0 of q)--(unten scaled u intersectionpoint q);
	drawarrow (point 1 of p)--(point 0.5 of p) withcolor red;
	draw (point 0.5 of p)--(point 0 of p) withcolor red;
	p := (unten scaled u intersectionpoint q)--(point 1 of q);
	drawarrow (point 0 of p)--(point 0.5 of p) withcolor blue;
	draw (point 0.5 of p)--(point 1 of p) withcolor blue;
endfor;

pickup pencircle scaled 1pt;

draw oben scaled u;
draw unten scaled u;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.top(btex $b$ etex, z2 shifted (10,0));
label.rt(btex $y$ etex, z4 shifted (0,10));

endfig;

end
