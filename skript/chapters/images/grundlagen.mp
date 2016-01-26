%
% grundlagen.mp -- Darstellungen zu den Grundlagen
%
% (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
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
%  Richtungsfeld einer gewohnlichen Differentialgleichung erster Ordnung
%
beginfig(1)

numeric unit;
unit = 20;

z0 = ( 0,  0);
z1 = (-4,  0) * unit;
z2 = (14,  0) * unit;
z3 = ( 0, -2) * unit;
z4 = ( 0, 12) * unit;
path p;
p = (-4.5,-2.5)--(14.5,-2.5)--(14.5,12.5)--(-4.5,12.5)--cycle;
p := p scaled unit;

pickup pencircle scaled 1.5pt;
draw ((-8,-4) * unit)--((12,16) * unit) withcolor red;

def solution(expr c, x) =
	(4 * (c * mexp(x * 0.25 * 256) + 0.25 * x + 1))
enddef;

def curve(expr c, m) =
	path q;
	q := (-4.5, solution(c, -4.5)) * unit;
	for x = -4.5 + 0.1 step 0.1 until m:
		q := q--((x, solution(c, x)) * unit);
	endfor;
	draw q withcolor red;
enddef;
for c = -2 step 0.2 until 2:
	curve(c, 14);
endfor;

clip currentpicture to p;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (20,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,20));

numeric l;
l = unit * 0.4;

numeric v;
v = 0.25;

def richtung(expr x, y) =
	((1, v * (y-x)) / sqrt(1 + v * v * (y-x) * (y-x)))
enddef;

pickup pencircle scaled 1pt;
for x = -4 step 1 until 14:
	for y = -2 step 1 until 12:
		draw (unit * (x,y) shifted (l * richtung(x, y)))
			--(unit * (x,y) shifted (-l * richtung(x, y)))
				withcolor blue;
	endfor;
endfor;

label.top(btex $x$ etex, z2 shifted (20, 0));
label.rt(btex $y$ etex, z4 shifted (0,20));

endfig;

%
% Vektorfeld in der Ebene mit Lösungskurve
%
beginfig(2)

numeric unit;
unit := 125;

z0 = (   0,    0);
z1 = (-1.5,    0) * unit;
z2 = ( 1.5,    0) * unit;
z3 = (   0, -1.5) * unit;
z4 = (   0,  1.5) * unit;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));
label.top(btex $y_1$ etex, z2 shifted (10,0));
label.rt(btex $y_2$ etex, z4 shifted (0,10));

path p;
p = (1,0);
for a = 5 step 5 until 355:
	p := p--(cosd(a), sind(a));
endfor;
p := p--cycle;
pickup pencircle scaled 1pt;
draw p scaled unit withcolor red;

def hopffield(expr x, y) =
	(x - y - x*(x*x+y*y), x+y-y*(x*x+y*y))
enddef;

def hopffieldp(expr z) =
	hopffield(xpart z, ypart z)
enddef;

def curve(expr z, l) =
	path p;
	p := z;
	for t = 0 step 1 until l:
		p := p--((point (length p) of p) shifted (0.01 * hopffieldp(point (length p) of p)));
	endfor;
	draw p scaled unit withcolor red;
enddef;

numeric outerlength;
outerlength = 200;
curve(( 1.5, 1.5), outerlength);
curve(( 1.0, 1.5), outerlength);
curve(( 0.5, 1.5), outerlength);
curve(( 0.0, 1.5), outerlength);
curve((-0.5, 1.5), outerlength);
curve((-1.0, 1.5), outerlength);
curve((-1.5, 1.5), outerlength);
curve((-1.5, 1.0), outerlength);
curve((-1.5, 0.5), outerlength);
curve((-1.5, 0.0), outerlength);
curve((-1.5,-0.5), outerlength);
curve((-1.5,-1.0), outerlength);
curve((-1.5,-1.5), outerlength);
curve((-1.0,-1.5), outerlength);
curve((-0.5,-1.5), outerlength);
curve(( 0.0,-1.5), outerlength);
curve(( 0.5,-1.5), outerlength);
curve(( 1.0,-1.5), outerlength);
curve(( 1.5,-1.5), outerlength);
curve(( 1.5,-1.0), outerlength);
curve(( 1.5,-0.5), outerlength);
curve(( 1.5, 0.0), outerlength);
curve(( 1.5, 0.5), outerlength);
curve(( 1.5, 1.0), outerlength);

numeric innerlength;
innerlength = 500;

for a = 0 step 30 until 330:
	curve(0.05 * (cosd(a), sind(a)), innerlength);
endfor;


pickup pencircle scaled 0.5pt;
for x = -1.5 step 0.1 until 1.55:
	for y = -1.5 step 0.1 until 1.55:
		drawarrow ((x, y) * unit)
			--(((x,y) * unit) shifted (5 * hopffield(x,y)))
				withcolor blue;
	endfor;
endfor;

endfig;

end
