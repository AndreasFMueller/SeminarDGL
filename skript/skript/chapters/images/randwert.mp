%
% randwert.mp -- Randwerteproblem Illustration
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
% Loesungen des Anfangswertproblems des Ball-Problems
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

pickup pencircle scaled 1pt;
drawarrow (-0.5 * xunit, 0)--z3;
drawarrow (0, -0.5 * yunit)--z4;

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

label.urt(btex $h(v_y)$ etex, z8);

endfig;

%
% Newton Algorithmus
%
beginfig(2)

numeric u;
u := 2.6;

z0 = (0, 0);
z1 = (140 * u, 0);
z2 = (0, 120 * u);

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

vardef sqr(expr t) =
	(t * t)
enddef;

vardef f(expr t) =
	(t,  295 - 300 * sqrt(1 - sqr((20 - t) / 150)))
enddef;

vardef fprime(expr t) = 
	((t - 20) / (75 * sqrt(1 - sqr((20 - t)/150))))
enddef;

path p;
p = f(0);
for t = 0 step 1 until 142:
	p := p--f(t);
endfor;
pickup pencircle scaled 1.5pt;
draw p scaled u;

def punkt(expr z) =
pickup pencircle scaled 5pt;
draw z scaled u withcolor white;
pickup pencircle scaled 4pt
draw z scaled u ;
pickup pencircle scaled 3pt;
draw z scaled u withcolor white;
enddef;

z10 = f(130);	z20 = (x10,0);
numeric t;
show x10;
t := x10 - y10 / fprime(x10);
z11 = f(t);	z21 = (x11,0);

t := x11 - y11 / fprime(x11);
z12 = f(t);	z22 = (x12,0);

t := x12 - y12 / fprime(x12);
z13 = f(t);	z23 = (x13,0);

def schraeg(expr a,b) =
	draw (((-0.1)[a,b])--((1.1)[a,b])) scaled u;
enddef;

pickup pencircle scaled 0.5pt;
draw (z10--(x11,0)) scaled u;
draw (z11--(x12,0)) scaled u;
draw (z12--(x13,0)) scaled u;

draw (z10--(x10,0)) scaled u;
draw (z11--(x11,0)) scaled u;
draw (z12--(x12,0)) scaled u;
draw (z13--(x13,0)) scaled u;

pickup pencircle scaled 1.0pt;
punkt(z10); punkt(z20);
punkt(z11); punkt(z21);
punkt(z12); punkt(z22);
punkt(z13); punkt(z23);

label.ulft(btex $f(x_0)$ etex, z10 scaled u);
label.ulft(btex $f(x_1)$ etex, z11 scaled u);
label.ulft(btex $f(x_2)$ etex, z12 scaled u);
label.ulft(btex $f(x_3)$ etex, z13 scaled u);

label.bot(btex $x_0$ etex, (x10,0) scaled u);
label.bot(btex $x_1$ etex, (x11,0) scaled u);
label.bot(btex $x_2$ etex, (x12,0) scaled u);
label.bot(btex $x_3$ etex, (x13,0) scaled u);

pickup pencircle scaled 0.5pt;
z30 = 0.3[z21,z10]; z40 = z30 shifted (3,-1); draw (z30--z40) scaled u;
z31 = 0.3[z22,z11]; z41 = z31 shifted (3,-1); draw (z31--z41) scaled u;

label.rt(btex $f'(x_0)$ etex, (z40 shifted (-1,0)) scaled u);
label.rt(btex $f'(x_1)$ etex, (z41 shifted (-1,0)) scaled u);

label.top(btex $x$ etex, z1 shifted (10,0));
label.rt(btex $y$ etex, z2 shifted (0,10));

endfig;


beginfig(3)

numeric u;
u := 100;

z0 = (0,0);
z1 = (-1.1, 0.0) * u;
z2 = ( 1.3, 0.0) * u;
z3 = (   0,-1.4) * u;
z4 = (   0, 0.9) * u;

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

def punkt(expr z, c, d) =
	pickup pencircle scaled (4pt + d);
	draw z withcolor c;
	pickup pencircle scaled 3pt;
	draw z withcolor white;
enddef;

z10 = ( 1.00000000000000,  0.00000000000000) * u;
z11 = ( 1.00000000000000,  0.66666666666667) * u;
z12 = ( 1.18145956607495,  0.40894148586456) * u;
z13 = ( 1.21892938822774,  0.47603850125054) * u;
z14 = ( 1.21960186643355,  0.47171212477008) * u;
z15 = ( 1.21961650811721,  0.47171126771255) * u;
z16 = ( 1.21961650797176,  0.47171126778939) * u;

z20 = (-0.50000000000000,  0.90000000000000) * u;
z21 = (-1.03346386614454,  0.53473359439896) * u;
z22 = (-0.94869292114783,  0.84186088141752) * u;
z23 = (-1.01928574066413,  0.81624551977315) * u;
z24 = (-1.01830880732553,  0.82036616183886) * u;
z25 = (-1.01832219520705,  0.82036324475529) * u;
z26 = (-1.01832219514285,  0.82036324488371) * u;

z30 = (-0.50000000000000, -0.90000000000000) * u;
z31 = ( 0.03453186187255, -1.19926426960959) * u;
z32 = (-0.23481848354109, -1.24856442593452) * u;
z33 = (-0.19890115373077, -1.29222132621203) * u;
z34 = (-0.20129444285241, -1.29207011738486) * u;
z35 = (-0.20129431282577, -1.29207451268755) * u;
z36 = (-0.20129431282890, -1.29207451267310) * u;

pickup pencircle scaled 0.5pt;

draw z0--z16 withcolor red;
draw z0--z26 withcolor red;
draw z0--z36 withcolor red;

drawarrow z10--z11;
drawarrow z11--z12;
drawarrow z12--z13;
drawarrow z13--z14;
drawarrow z14--z15;
drawarrow z15--z16;

drawarrow z20--z21;
drawarrow z21--z22;
drawarrow z22--z23;
drawarrow z23--z24;
drawarrow z24--z25;
drawarrow z25--z26;

drawarrow z30--z31;
drawarrow z31--z32;
drawarrow z32--z33;
drawarrow z33--z34;
drawarrow z34--z35;
drawarrow z35--z36;

punkt(z10, black, 0);
punkt(z11, black, 0);
punkt(z12, black, 0);
punkt(z13, black, 0);
punkt(z14, black, 0);
punkt(z15, black, 0);
punkt(z16, red, 0.8pt);

punkt(z20, black, 0);
punkt(z21, black, 0);
punkt(z22, black, 0);
punkt(z23, black, 0);
punkt(z24, black, 0);
punkt(z25, black, 0);
punkt(z26, red, 0.8pt);

punkt(z30, black, 0);
punkt(z31, black, 0);
punkt(z32, black, 0);
punkt(z33, black, 0);
punkt(z34, black, 0);
punkt(z35, black, 0);
punkt(z36, red, 0.8pt);

label.urt(btex $\hat{z}_1$ etex, z16);
label.ulft(btex $\hat{z}_2$ etex, z26);
label.bot(btex $\hat{z}_3$ etex, z36);

label.top(btex $x$ etex, (z2 shifted (10,0)));
label.rt(btex $y$ etex, (z4 shifted (0,10)));

endfig;

end
