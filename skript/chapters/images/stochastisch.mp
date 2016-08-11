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

%
% Darstellung einer Brownschen Bewegung
%
beginfig(2)

input path2.mp;

if xminimum > -0.5:
	xminimum := -0.5;
fi;
if yminimum > -0.5:
	yminimum := -0.5;
fi;
if xmaximum < 0.5:
	xmaximum := 0.5;
fi;
if ymaximum < 0.5:
	ymaximum := 0.5;
fi;

% compute the common scale factor
numeric u, v;
u := 360 / (xmaximum - xminimum + 0.2);
v := 240 / (ymaximum - yminimum + 0.2);
if u < v:
	u := v;
fi;

numeric b;
b = 1.05;
numeric pscale;
pathscale := 1;
p := p scaled pathscale;

z0 = (0,0);

path q;

z1 = ( xminimum * u - 20, 0);
z2 = ( xmaximum * u + 20, 0);
z3 = ( 0, yminimum * u - 20);
z4 = ( 0, ymaximum * u + 20);

z10 = (0.9 * xminimum + 0.1, 0.9 * yminimum + 0.1);
z11 = (0.9 * xmaximum - 0.1, 0.9 * yminimum + 0.1);
z12 = (0.9 * xmaximum - 0.1, 0.9 * ymaximum - 0.1);
z13 = (0.9 * xminimum + 0.1, 0.9 * ymaximum - 0.1);

%
%    .  z25 ----  z24  .
%  z26  z13 ----- z12  z23
%   |    |         |    |
%   |    |         |    |
%  z27  z10 ----- z11  z22
%    .  z20 ----- z21  .
%
z20 = z10 scaled u shifted (  0,-20);
z21 = z11 scaled u shifted (  0,-20);
z22 = z11 scaled u shifted ( 20,  0);
z23 = z12 scaled u shifted ( 20,  0);
z24 = z12 scaled u shifted (  0, 20);
z25 = z13 scaled u shifted (  0, 20);
z26 = z13 scaled u shifted (-20,  0);
z27 = z10 scaled u shifted (-20,  0);

label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $y$ etex, z4 shifted (0,10));

q :=      z21{dir   0}..{dir  90}z22
        --z23{dir  90}..{dir 180}z24
        --z25{dir 180}..{dir -90}z26
        --z27{dir -90}..{dir   0}z20--cycle;

fill      (xminimum - 0.1, yminimum - 0.1)
	--(xmaximum + 0.1, yminimum - 0.1)
	--(xmaximum + 0.1, ymaximum + 0.1)
	--(xminimum - 0.1, ymaximum + 0.1)--cycle scaled u withcolor 0.97;

fill q withcolor 1;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

(t0, t1) = p scaled u intersectiontimes q;
z30 = point t1 of q;
z31 = point length p of p scaled u;
pickup pencircle scaled 4pt;
draw z30 withcolor red;

pickup pencircle scaled 1.5pt;
draw q;

pickup pencircle scaled 1pt;

draw subpath(t0,length p) of p scaled u withcolor 0.7;
draw subpath(0,t0) of p scaled u withcolor red;

pickup pencircle scaled 4pt;
draw z0 withcolor red;
pickup pencircle scaled 3pt;
draw z0 withcolor white;
label.ulft(btex $X(0)$ etex, z0);

pickup pencircle scaled 4pt;
draw z30 withcolor red;
pickup pencircle scaled 3pt;
draw z30 withcolor white;
label.urt(btex $X(\tau)$ etex, z30);

pickup pencircle scaled 4pt;
draw z31 withcolor 0.8;
pickup pencircle scaled 3pt;
draw z31 withcolor white;
label.llft(btex $X(T)$ etex, z31);

endfig;

input path3.mp;

numeric u, v;
u := 240;
v := 80 / (maximum - minimum);

def graph(expr n, p, pprevious) =
beginfig(n)
z0 = (0, 0);
z1 = (u, 0);
z2 = (0, minimum * v);
z3 = (0, maximum * v);
numeric m;
m = length p;

pickup pencircle scaled 1pt;

drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z2 shifted (0,-10))--(z3 shifted (0,10));

label.top(btex $t$ etex, z1 shifted (10,0));
%label.rt(btex $W(t)$ etex, z3 shifted (0,10));
label.rt(TEX("$W_{" & decimal(n-2) & "}(t)\mathstrut$"), z3 shifted (0,10));

if m >= 2:
	for i = 1 step 2 until m - 0.5:
		draw ((point i of p)--(point (0.5 * i) of pprevious))
			xscaled u yscaled v withcolor blue;
	endfor;
fi;

draw pprevious xscaled u yscaled v withcolor 0.8;
draw p xscaled u yscaled v withcolor red;

z12 = point length p of p xscaled u yscaled v;
label.rt(TEX("$W_{" & decimal(n-2) & "}(T)\mathstrut$"), z12);

if m = 2:
	z10 = point 1 of p xscaled u yscaled v;
	z11 = point 0.5 of pprevious xscaled u yscaled v;
	label.rt(btex $Y$ etex, 0.5[z10,z11]);
	label.top(btex $W_2(T/2)$ etex, z10);
fi;

endfig;
enddef;

path pzero;
pzero := (0,0)--(0,0);

graph(3, pone, pzero);
graph(4, ptwo, pone);
graph(5, pthree, ptwo);
graph(6, pfour, pthree);
graph(7, pfive, pfour);
graph(8, psix, pfive);
graph(9, pseven, psix);
graph(10, peight, pseven);
graph(11, pnine, peight);
graph(12, pten, pnine);
graph(13, peleven, pten);

end
