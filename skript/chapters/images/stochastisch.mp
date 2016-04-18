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

numeric u, v;
u := 360 / (xmaximum - xminimum);
v := 240 / (ymaximum - yminimum);
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

z1 = ( b * xminimum * u, 0);
z2 = ( b * xmaximum * u, 0);
z3 = ( 0, b * yminimum * u);
z4 = ( 0, b * ymaximum * u);

label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $y$ etex, z4 shifted (0,10));

q :=   		   (0.9 * xmaximum, 0.8 * ymaximum){dir 90}
	..{dir 180}(0.8 * xmaximum, 0.9 * ymaximum)
	--         (0.8 * xminimum, 0.9 * ymaximum){dir 180}
	..{dir -90}(0.9 * xminimum, 0.8 * ymaximum)
	--         (0.9 * xminimum, 0.8 * yminimum){dir -90}
	..{dir   0}(0.8 * xminimum, 0.9 * yminimum)
	--         (0.8 * xmaximum, 0.9 * yminimum){dir 0}
	..{dir  90}(0.9 * xmaximum, 0.8 * yminimum)--cycle;

fill (xminimum,yminimum)--(xmaximum,yminimum)--(xmaximum,ymaximum)
	--(xminimum,ymaximum)--cycle scaled (b * u) withcolor 0.97;
fill q scaled u withcolor 1;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

(t0, t1) = p intersectiontimes q;
z10 = (p intersectionpoint q) scaled u;
z11 = point length p of p scaled u;
pickup pencircle scaled 4pt;
draw z10 withcolor red;

pickup pencircle scaled 1.5pt;
draw q scaled u;

pickup pencircle scaled 1pt;

draw subpath(t0,length p) of p scaled u withcolor 0.7;
draw subpath(0,t0) of p scaled u withcolor red;

pickup pencircle scaled 4pt;
draw z0 withcolor red;
pickup pencircle scaled 3pt;
draw z0 withcolor white;
label.urt(btex $X(0)$ etex, z0);

pickup pencircle scaled 4pt;
draw z10 withcolor red;
pickup pencircle scaled 3pt;
draw z10 withcolor white;
label.llft(btex $X(\tau)$ etex, z10);

pickup pencircle scaled 4pt;
draw z11 withcolor 0.8;
pickup pencircle scaled 3pt;
draw z11 withcolor white;
label.lrt(btex $X(T)$ etex, z11);

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
	label.bot(btex $W_2(T/2)$ etex, z10);
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
