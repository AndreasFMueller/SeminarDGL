%
% nullklinen.mp -- Nullklinen zum Studium von 2D Differentialgleichungen
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
u := 100;

z0 = (      0,       0);
z1 = (2.5 * u,       0);
z2 = (      0, 1.5 * u);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

z10 = (  2 * u,       0);
z11 = (      0,       u);
z12 = (      u,       0);
z13 = (      0, 2/3 * u);
z14 = (z10--z13) intersectionpoint (z11--z12);

pickup pencircle scaled 1.5pt;

% y_1 Nullklinen
draw (z0 shifted (0,-10))--(z2 shifted (0,10)) withcolor red;
draw ((-0.133)[z10,z13])--((1.05)[z10,z13]) withcolor red;

% y_2 Nullklinen
draw (z0 shifted (-10,0))--(z1 shifted (10,0)) withcolor blue;
draw ((-0.1)[z11,z12])--((1.1)[z11,z12]) withcolor blue;

pickup pencircle scaled 4pt;

draw z0;
draw z10;
draw z11;
draw z14;

pickup pencircle scaled 2.5pt;

draw z0 withcolor white;
draw z10 withcolor white;
draw z11 withcolor white;
draw z14 withcolor white;

label.top(btex $y_1$ etex, z1 shifted (10,0));
label.rt(btex $y_2$ etex, z2 shifted (0,10));

z20 = 0.5[z13,z14];
z21 = 0.5[z14,z10];

z22 = 0.5[z14,z12];
z23 = 0.5[z11,z14];

def arrow(expr z, d) =
	pickup pencircle scaled 2pt;
	draw z;
	pickup pencircle scaled 1pt;
	drawarrow z--(z shifted (10 * (cosd(d),sind(d))));
enddef;

arrow(z20,  90);
arrow(z21, -90);
arrow(z22,   0);
arrow(z23, 180);

z31 = (1.5 * u, 1 * u);
arrow(z31, -135);

z32 = 0.3333 * (z14 + z10 + z12);
arrow(z32, -45);

z33 = 0.3333 * (z14 + z13 + z11);
arrow(z33, 135);

z34 = 0.25 * (z0 + z14 + z12 + z13);
arrow(z34, 45);

z35 = 0.5[z0,z12];
z36 = 0.5[z12,z10];
z37 = (2.2*u,0);

arrow(z35, 0);
arrow(z36, 0);
arrow(z37, 180);

z38 = 0.5[z0,z13];
z39 = 0.4[z13,z11];
z40 = (0,1.2*u);

arrow(z38, 90);
arrow(z39, 90);
arrow(z40, -90);

endfig;

def l(expr z) =
	sqrt((xpart z) * (xpart z) + (ypart z) * (ypart z))
enddef;

vardef linverse(expr z) =
	numeric	lvalue;
	if l(z) = 0:
		lvalue := 1;
	else:
		lvalue := 1/l(z);
	fi;
	lvalue
enddef;

def fo(expr a, b) =
	(a*(2-a-3*b), b*(1-a-b))
enddef;

def f(expr z) =
	fo(xpart z, ypart z)
enddef;

def	normalize(expr z) =
	(z scaled linverse(z))
enddef;

def fnormed(expr z) =
	normalize(f(z))
enddef;

%
% Vektorfeld für Beispiel 1
%
beginfig(2)

numeric u;
u := 140;

z0 = (      0,       0);
z1 = (2.5 * u,       0);
z2 = (      0, 1.5 * u);

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

z10 = (  2 * u,       0);
z11 = (      0,       u);
z12 = (      u,       0);
z13 = (      0, 2/3 * u);
z14 = (z10--z13) intersectionpoint (z11--z12);

pickup pencircle scaled 1.5pt;

% y_1 Nullklinen
draw (z0 shifted (0,-10))--(z2 shifted (0,10)) withcolor red;
draw ((-0.133)[z10,z13])--((1.05)[z10,z13]) withcolor red;

% y_2 Nullklinen
draw (z0 shifted (-10,0))--(z1 shifted (10,0)) withcolor blue;
draw ((-0.1)[z11,z12])--((1.1)[z11,z12]) withcolor blue;

pickup pencircle scaled 4pt;

draw z0;
draw z10;
draw z11;
draw z14;

pickup pencircle scaled 2.5pt;

draw z0 withcolor white;
draw z10 withcolor white;
draw z11 withcolor white;
draw z14 withcolor white;

label.top(btex $y_1$ etex, z1 shifted (10,0));
label.rt(btex $y_2$ etex, z2 shifted (0,10));

numeric tstep;
tstep = 0.05;
numeric sstep;
sstep = tstep;

def arrow(expr z) =
	pickup pencircle scaled 0.7pt;
	draw z scaled u;
	pickup pencircle scaled 0.3pt;
	draw (z scaled u)--((z scaled u) shifted (5 * fnormed(z)));
enddef;

for t = -1.5 * tstep step tstep until 2.55:
	for s = -1.5 * sstep step sstep until 1.55:
		arrow((t,s));
	endfor;
endfor;

endfig;

%
% Nullklinen und Vektorfeld um den instabilen Fixpunkt (0.5,0.5)
%
beginfig(3)

numeric u;
u := 1000;

z0 = (0.5 * u, 0.5 * u);

pickup pencircle scaled 1.5pt;

draw (z0 shifted (-200,200))--(z0 shifted (200,-200)) withcolor blue;
draw (z0 shifted (-200,200/3))--(z0 shifted (200,-200/3)) withcolor red;

z1 = z0 shifted (-160,-100);
z2 = z0 shifted ( 160,-100);
z3 = z0 shifted ( 160, 100);
z4 = z0 shifted (-160, 100);

clip currentpicture to z1--z2--z3--z4--cycle;

pickup pencircle scaled 0.5pt;

numeric tstep;
tstep = 0.005;
numeric sstep;
sstep = tstep;

def arrow(expr z) =
	pickup pencircle scaled 0.7pt;
	draw (z scaled u);
	pickup pencircle scaled 0.3pt;
	draw (z scaled u)--((z scaled u) shifted (5 * fnormed(z)));
enddef;

for t = 0.5 - 0.16 step tstep until 0.5 + 0.16:
	for s = 0.5 - 0.1 step sstep until 0.5 + 0.1:
		arrow((t,s));
	endfor;
endfor;

pickup pencircle scaled 4pt;
draw z0;
pickup pencircle scaled 2.5pt;
draw z0 withcolor white;

endfig;

%
% Nullklinen und Vektorfeld um den stabilen Fixpunkt (2,0)
%
beginfig(4)

numeric u;
u := 1000;

z0 = (2 * u, 0 * u);

pickup pencircle scaled 1.5pt;

draw (z0 shifted (-200,0))--(z0 shifted (200,0)) withcolor blue;
draw (z0 shifted (-200,200/3))--(z0 shifted (200,-200/3)) withcolor red;

z1 = z0 shifted (-160,-100);
z2 = z0 shifted ( 160,-100);
z3 = z0 shifted ( 160, 100);
z4 = z0 shifted (-160, 100);

clip currentpicture to z1--z2--z3--z4--cycle;

pickup pencircle scaled 0.5pt;

numeric tstep;
tstep = 0.005;
numeric sstep;
sstep = tstep;

def arrow(expr z) =
	pickup pencircle scaled 0.7pt;
	draw (z scaled u);
	pickup pencircle scaled 0.3pt;
	draw (z scaled u)--((z scaled u) shifted (5 * fnormed(z)));
enddef;

for t = 2 - 0.16 step tstep until 2 + 0.16:
	for s = -0.1 step sstep until 0.1:
		arrow((t,s));
	endfor;
endfor;

pickup pencircle scaled 4pt;
draw z0;
pickup pencircle scaled 2.5pt;
draw z0 withcolor white;

endfig;

numeric xrange;
xrange := 2.3;
numeric a, b;
a := -0.8;
b := 0.9;
def line(expr t) =
	(t * u, u * (t - a) / b)
enddef;

def drawline =
	numeric tmin;
	tmin = -xrange;
	if ((tmin - a) / b) < -1.7:
		tmin := a - b * 1.7;
	fi;
	numeric tmax;
	tmax = xrange;
	if ((tmax - a) / b) > 1.7:
		tmax := a + b * 1.7;
	fi;
	path q;
	q := line(tmin)--line(tmax);
	pickup pencircle scaled 1.5pt;
	draw q withcolor blue;
enddef;

def arrow(expr z, a, l) =
	pickup pencircle scaled 1pt;
	draw z;
	pickup pencircle scaled 0.5pt;
	drawarrow z--(z shifted (l * (cosd(a),sind(a))));
enddef;

def cube(expr t) =
	(t * u, u * t * (1 - t * t / 3))
enddef;

%
% Nulllklinen im FH-Modell
%
beginfig(5)

numeric u;
u = 80;

z0 = (0,0);
z1 = (-xrange * u,        0);
z2 = ( xrange * u,        0);
z3 = (          0, -1.7 * u);
z4 = (          0,  1.7 * u);

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

path p;
p := cube(-xrange);
numeric tstep;
tstep := 0.05;

for t = -xrange + tstep step tstep until xrange + (0.5 * tstep):
	p := p -- cube(t);
endfor;

pickup pencircle scaled 1.5pt;
draw p withcolor red;

drawline;

z10 = p intersectionpoint q;

pickup pencircle scaled 4pt;
draw z10;
pickup pencircle scaled 2.5pt;
draw z10 withcolor white;

label(btex links etex, (1.2*u, 1.4*u)) withcolor red;
label(btex rechts etex, (0.4*u, -1.4*u)) withcolor red;
label(btex unten etex, (-1.0*u, 1.4*u)) withcolor blue;
label(btex oben etex, (-0.4*u, -1.4*u)) withcolor blue;

z11 = (-sqrt(3), 0);
z12 = ( sqrt(3), 0); 

arrow(( 1.2 * u,  1.1 * u), 135, 15);
arrow(( 1.2 * u, -1.1 * u),  45, 15);
arrow((-1.2 * u,  1.1 * u),-135, 15);
arrow((-1.2 * u, -1.1 * u),  45, 15);
arrow((-2.0 * u, -0.7 * u), -45, 15);

for t = 2.3 step -0.2 until -1.2:
	arrow(cube(t),  90, 10);
endfor;
for t = 0.7 step -0.2 until -1.2:
	arrow(line(t), 180, 10);
endfor;
for t = -2.3 step 0.2 until -1.4:
	arrow(cube(t), -90, 10);
endfor;
for t = -2.3 step 0.2 until -1.4:
	arrow(line(t),   0, 10);
endfor;

label.top(btex $v$ etex, z2 shifted (10,0));
label.rt(btex $w$ etex, z4 shifted (0,10));
z20 = ( sqrt(3) * u, 0);
z21 = (-sqrt(3) * u, 0);
label.urt(btex $\sqrt{3}$ etex, z20);
label.llft(btex $-\sqrt{3}$ etex, z21);

endfig;

%
% Fitzhugh-Nagumo-Modell mit drei kritischen Punkten
%
beginfig(6)

numeric u;
u = 80;

z0 = (0,0);
z1 = (-xrange * u,        0);
z2 = ( xrange * u,        0);
z3 = (          0, -1.7 * u);
z4 = (          0,  1.7 * u);

a := 0;
b := 4;

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

path p;
p := cube(-xrange);
numeric tstep;
tstep := 0.05;

for t = -xrange + tstep step tstep until xrange + (0.5 * tstep):
	p := p -- cube(t);
endfor;

pickup pencircle scaled 1.5pt;
draw p withcolor red;

drawline;

z10 = p intersectionpoint q;
z11 = -z10;

pickup pencircle scaled 4pt;
draw z10;
draw z11;
draw z0;
pickup pencircle scaled 2.5pt;
draw z10 withcolor white;
draw z11 withcolor white;
draw z0 withcolor white;

label(btex links  etex, ( 1.2*u,  1.4*u)) withcolor red;
label(btex rechts etex, ( 1.2*u, -1.4*u)) withcolor red;
label(btex unten  etex, (-1.2*u,  1.4*u)) withcolor blue;
label(btex oben   etex, (-1.2*u, -1.4*u)) withcolor blue;

arrow(( 1.2 * u,  1.1 * u),-135, 15);
arrow(( 1.2 * u, -1.1 * u),  45, 15);
arrow((-1.2 * u,  1.1 * u),-135, 15);
arrow((-1.2 * u, -1.1 * u),  45, 15);

arrow(( 0.85 * u,  0.45 * u), -45, 15);
arrow((-0.85 * u, -0.45 * u), 135, 15);

arrow((-2.3 * u,  0.4 * u), -45, 15);
arrow(( 2.3 * u, -0.4 * u), 135, 15);

for t = -2.2 step 0.2 until -1.5:
	arrow(cube(t), -90, 10);
	arrow(line(t),   0, 10);
endfor;

for t = -1.3 step 0.2 until 0:
	arrow(cube(t),  90, 10);
	arrow(line(t), 180, 10);
endfor;

for t = 0.1 step 0.2 until 1.4:
	arrow(cube(t), -90, 10);
	arrow(line(t),   0, 10);
endfor;
for t = 1.6 step 0.2 until 2.3:
	arrow(cube(t),  90, 10);
	arrow(line(t), 180, 10);
endfor;

label.top(btex $v$ etex, z2 shifted (10,0));
label.rt(btex $w$ etex, z4 shifted (0,10));
z20 = ( sqrt(3) * u, 0);
z21 = (-sqrt(3) * u, 0);
label.urt(btex $\sqrt{3}$ etex, z20);
label.llft(btex $-\sqrt{3}$ etex, z21);

endfig;


end
