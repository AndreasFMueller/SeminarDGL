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
u := 200;

z0 = (       0,        0);
z1 = (-0.3 * u,        0);
z2 = ( 1.3 * u,        0);
z3 = (       0, -0.3 * u);
z4 = (       0,  1.3 * u);

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

z10 = (-0.3 * u,  1.3 * u);
z11 = ( 1.3 * u, -0.3 * u);
z12 = (-0.3 * u, -0.3 * u);
z13 = ( 1.3 * u,  1.3 * u);

z14 = (-0.3 * u,        u);
z15 = ( 1.3 * u,        u);
z16 = (       u, -0.3 * u);
z17 = (       u,  1.3 * u);

z20 = ( 0.5 * u,  0.5 * u);
z21 = (       u,        0);
z22 = (       u,        u);
z23 = (       0,        u);

pickup pencircle scaled 1.5pt;

draw z12--z13 withcolor red;
draw z14--z15 withcolor red;
draw z1--z2 withcolor red;

draw z10--z11 withcolor blue;
draw z16--z17 withcolor blue;
draw z3--z4 withcolor blue;

pickup pencircle scaled 4pt;

draw z0;
draw z20;
draw z21;
draw z22;
draw z23;

pickup pencircle scaled 2.5pt;

draw z0 withcolor white;
draw z20 withcolor white;
draw z21 withcolor white;
draw z22 withcolor white;
draw z23 withcolor white;

label.bot(btex rechts etex, ( 0.5 * u, 1.3 * u)) withcolor red;
label.bot(btex links  etex, ( 0.5 * u, 0.8 * u)) withcolor red;
label.top(btex rechts etex, ( 0.5 * u, 0.2 * u)) withcolor red;
label.top(btex links  etex, ( 0.5 * u,-0.3 * u)) withcolor red;
label.rt (btex links  etex, ( 1.2 * u, 1.1 * u)) withcolor red;
label.lft(btex rechts etex, (-0.2 * u,-0.1 * u)) withcolor red;

label.rt (btex oben   etex, ( 1.1 * u, 0.5 * u)) withcolor blue;
label.lft(btex unten  etex, ( 0.9 * u, 0.5 * u)) withcolor blue;
label.rt (btex oben   etex, ( 0.1 * u, 0.5 * u)) withcolor blue;
label.lft(btex unten  etex, (-0.1 * u, 0.5 * u)) withcolor blue;
label.bot(btex oben   etex, (-0.1 * u, 1.3 * u)) withcolor blue;
label.top(btex unten  etex, ( 1.1 * u,-0.3 * u)) withcolor blue;

def arrow(expr z, a, l) =
	pickup pencircle scaled 1.5pt;
	draw z;
	pickup pencircle scaled 0.7pt;
	drawarrow z--(z shifted (l * (cosd(a), sind(a))));
enddef;

arrow(( 0.75 * u, 1.15 * u), -45, 15);
arrow(( 0.25 * u, 1.15 * u), -45, 15);

arrow(( 0.75 * u,-0.15 * u), 135, 15);
arrow(( 0.25 * u,-0.15 * u), 135, 15);

arrow(( 1.15 * u, 0.75 * u),  45, 15);
arrow(( 1.15 * u, 0.25 * u),  45, 15);

arrow((-0.15 * u, 0.75 * u),-135, 15);
arrow((-0.15 * u, 0.25 * u),-135, 15);


arrow(( 0.75 * u, 0.90 * u), -135, 15);
arrow(( 0.25 * u, 0.90 * u), -135, 15);

arrow(( 0.75 * u, 0.10 * u),   45, 15);
arrow(( 0.25 * u, 0.10 * u),   45, 15);

arrow(( 0.10 * u, 0.25 * u),  135, 15);
arrow(( 0.10 * u, 0.75 * u),  135, 15);

arrow(( 0.90 * u, 0.25 * u),  -45, 15);
arrow(( 0.90 * u, 0.75 * u),  -45, 15);


arrow(( 1.15 * u,-0.10 * u),  135, 15);
arrow(( 1.10 * u,-0.15 * u), -135, 15);

arrow((-0.10 * u,-0.15 * u), -135, 15);
arrow((-0.20 * u,-0.05 * u),  -45, 15);

arrow((-0.15 * u, 1.10 * u),  -45, 15);
arrow((-0.10 * u, 1.15 * u),   45, 15);

arrow(( 1.20 * u, 1.05 * u),  135, 15);
arrow(( 1.10 * u, 1.15 * u),   45, 15);

numeric sa;
sa := 7;

for t = -0.25 step 0.1 until 0:
	arrow((t * u, (1 - t) * u), 0, sa);
	arrow((t * u, u), -90, sa);
	arrow((t * u, 0), -90, sa);
	arrow((t * u, t * u), -90, sa);
	arrow((0, t * u), 180, sa);
	arrow((u, t * u), 180, sa);
endfor;

for t = 0.05 step 0.1 until 0.5:
	arrow((t *u, (1 - t) * u), 180, sa);
	arrow((t * u, u), -90, sa);
	arrow((t * u, 0),  90, sa);
	arrow((t * u, t * u), 90, sa);
	arrow((0, t * u), 180, sa);
	arrow((u, t * u), 0, sa);
endfor;

for t = 0.55 step 0.1 until 1:
	arrow((t * u, (1 - t) * u), 0, sa);
	arrow((t * u, u), -90, sa);
	arrow((t * u, 0),  90, sa);
	arrow((t * u, t * u), -90, sa);
	arrow((0, t * u), 180, sa);
	arrow((u, t * u), 0, sa);
endfor;

for t = 1.05 step 0.1 until 1.3:
	arrow((t *u, (1 - t) * u), 180, sa);
	arrow((t * u, u), 90, sa);
	arrow((t * u, 0), 90, sa);
	arrow((t * u, t * u), 90, sa);
	arrow((0, t * u), 0, sa);
	arrow((u, t * u), 0, sa);
endfor;

label.top(btex $y_1$ etex, z2 shifted (10,0));
label.rt(btex $y_2$ etex, z4 shifted (0,10));

endfig;

end
