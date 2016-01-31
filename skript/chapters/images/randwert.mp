%
% randwert.mp -- Randwerteproblem illustration
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
% 
%

beginfig(1)

numeric xunit, yunit;
xunit := 18;
yunit := 18;

numeric vx;
vx = 8;
numeric vy;
numeric g;
g := 9.81;

vardef pfad(expr t) =
	(vx * t * xunit, (vy * t - 0.5 * g * t * t) * yunit)
enddef;

path p;

def solution(expr tmin, tmax) =
	p := pfad(tmin);
	numeric deltat;
	deltat := (tmax - tmin) / 100;
	for t = tmin + deltat step deltat until (tmax - deltat/2):
		p := p--pfad(t);
	endfor;
enddef;

vardef scheitel(expr vy) =
	(vx * vy/g * xunit, vy * vy / (2 * g) * yunit)
enddef;

z0 = (0,0);
z1 = (20 * xunit, 0);
z2 = (0, 12 * yunit);

z3 = (21 * xunit, 0);
z4 = (0, 12.5 * yunit);

z5 = (8 * xunit, 0);
z6 = (0, 15 * yunit);
z7 = z5 shifted z6;

pickup pencircle scaled 1pt;
drawarrow (-0.5 * xunit, 0)--z3;
drawarrow (0, -0.5 * yunit)--z4;

pickup pencircle scaled 1.5pt;
drawarrow (z0--z5) scaled 0.5;
drawarrow (z5--z7) scaled 0.5;

pickup pencircle scaled 1pt;

for v = 5 step 1 until 15:
	vy := v;
	solution(-0.1, 2.6); draw p withcolor blue;
endfor;

pickup pencircle scaled 0.5pt;

draw (20 * xunit, -0.5 * yunit)--(20 * xunit, 16.5 * yunit);

pickup pencircle scaled 1.5pt;

vy := 12.2625;
solution(-0.1, 2.6); draw p withcolor red;

clip currentpicture to	( -0.5 * xunit,  -0.5 * yunit)--
			( 20.5 * xunit,  -0.5 * yunit)--
			( 20.5 * xunit,  12.5 * yunit)--
			( -0.5 * xunit,  12.5 * yunit)--cycle;

vy := 15;
z8 = pfad(2.5);

label.bot(btex $v_x$ etex, 0.25[z0,z5]);
label.ulft(btex $v_y$ etex, z7 scaled 0.5);

pickup pencircle scaled 0.5pt;

draw z0--((0.83)[z0,z7]);

pickup pencircle scaled 3pt;

label.bot(btex $v_y = 5$ etex, scheitel(5)) withcolor blue;
draw scheitel(5) withcolor blue;

label.top(btex $v_y = 10$ etex, scheitel(10)) withcolor blue;
draw scheitel(10) withcolor blue;

label.top(btex $v_y = 15$ etex, scheitel(15)) withcolor blue;
draw scheitel(15) withcolor blue;

draw scheitel(12.2625) withcolor red;
label.top(btex $v_y = 12.2625$ etex, scheitel(12.2625)) withcolor red;

pickup pencircle scaled 5pt;
draw z0 withcolor white;
draw z1 withcolor white;
draw z8 withcolor white;
pickup pencircle scaled 4pt;
draw z0;
draw z1;
draw z8;
pickup pencircle scaled 2pt;
draw z0 withcolor white;
draw z1 withcolor white;
draw z8 withcolor white;

label.top(btex $x$ etex, z3);
label.rt(btex $y$ etex, z4);

label.urt(btex $y(v_y)$ etex, z8);

endfig;

end
