%
% 601.mp -- Bilder zur Uebungsaufgabe
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
% 
%
beginfig(1)

numeric u;
u := 100;

z0 = (           0,      0);
z1 = (-sqrt(2) * u,      0);
z2 = ( sqrt(2) * u,      0);
z3 = (           0, -1 * u);
z4 = (           0,  1 * u);

def arrow(expr z, a, l) =
	pickup pencircle scaled 1.5pt;
	draw z;
	pickup pencircle scaled 0.7pt;
	drawarrow z--(z shifted (l * (cosd(a), sind(a))));
enddef;

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

draw z1--z2 withcolor red;

def parabola(expr t) =
	(t * u, (t * t - 1) * u)
enddef;

path p;
p := parabola(-sqrt(2));
for t = -1.4 step 0.05 until sqrt(2):
	p := p--parabola(t);
endfor;
p := p--parabola(sqrt(2));
draw p withcolor blue;

label.top(btex $y_1$ etex, z2 shifted (10,0));
label.rt(btex $y_2$ etex, z4 shifted (0,10));

label.bot(btex unten  etex, ( 0.2 * u,  1.0 * u)) withcolor blue;
label.top(btex oben   etex, ( 1.2 * u, -1.0 * u)) withcolor blue;

label.bot(btex rechts etex, (-0.2 * u,  u)) withcolor red;
label.top(btex links  etex, (-1.2 * u, -u)) withcolor red;

arrow(( 0.6 * u,  0.5 * u), -45, 15);
arrow((-0.6 * u,  0.5 * u), -45, 15);

arrow(( 0.3 * u, -0.5 * u), -135, 15);
arrow((-0.3 * u, -0.5 * u), -135, 15);

arrow(( 1.1 * u, -0.5 * u),  135, 15);
arrow((-1.1 * u, -0.5 * u),  135, 15);

arrow(( 1.35 * u, 0.3 * u),  45, 15);
arrow((-1.35 * u, 0.3 * u),  45, 15);

numeric sa;
sa := 7;

for t = -1.3 step 0.2 until -1:
	arrow((t * u, 0), 90, sa);
	arrow(parabola(t), 0, sa);
endfor;

for t = -0.9 step 0.2 until 1:
	arrow((t * u, 0),  -90, sa);
	arrow(parabola(t), 180, sa);
endfor;

for t = 1.1 step 0.2 until 1.4:
	arrow((t * u, 0), 90, sa);
	arrow(parabola(t), 0, sa);
endfor;

z10 = ( u, 0);
z11 = (-u, 0);

pickup pencircle scaled 4pt;

draw z10;
draw z11;

pickup pencircle scaled 2.5pt;

draw z10 withcolor white;
draw z11 withcolor white;

endfig;

end
