%
% numerik.mp -- Darstellungen zur Numerik
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
\usepackage{color}
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

numeric alpha, unit, yzero;
alpha := 0.9;
unit := 110;
yzero := 1.5;

z0 = (0,0);
z1 = (2 * unit, 0);
z2 = (0, yzero * unit);

path p;

def solution(expr n) =
	p := z2;
	numeric yvalue, h;
	yvalue := yzero;
	h := 2 / n;
	pickup pencircle scaled 3pt;
	draw z2 withcolor red;
	for i = 1 step 1 until n:
		yvalue := (1 - alpha * h) * yvalue;
		p := p--(i * h * unit, yvalue * unit);
		draw (i * h * unit, yvalue * unit) withcolor red;
	endfor;
	pickup pencircle scaled 1pt;
	draw p withcolor red;
enddef;

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-5,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-5))--(z2 shifted (0,10));

p := z2;
for x := 0.01 step 0.01 until 2.03:
	p := p..(x * unit, yzero * mexp(-alpha * x * 256.) * unit);
endfor;
draw p withcolor blue;

z3 = (unit, yzero * mexp(-alpha * 256.) * unit);

label.urt(btex $y(x)=y_0e^{-\alpha x}$ etex, z3 shifted (20,20)) withcolor blue;
pickup pencircle scaled 0.5pt;
draw z3--(z3 shifted (20,20)) withcolor blue;

solution(2);
solution(4);
solution(8);
solution(16);

label.bot(btex $x$ etex, z1 shifted (10,0));
label.lft(btex $y$ etex, z2 shifted (0,10));

numeric n, h;
n = 2;
for i = 1 step 1 until 4:
	h := 2 / n;
	numeric yvalue;
	yvalue := yzero;
	for k = 1 step 1 until n:
		yvalue := yvalue * (1 - alpha * h);
	endfor;
	n := 2 * n;
	label.rt(TEX("$n=" & decimal(n) & "\mathstrut$"),
		(2.2 * unit, i * 12 - 5)) withcolor red;
	pickup pencircle scaled 0.5pt;
	draw (2 * unit, yvalue * unit)--(2.2 * unit, i * 12 - 5) withcolor red;
endfor;


endfig;

%
% Einzelschritt lineare Approximation
%
beginfig(2)

z0 = (0,0);
z1 = (80,50);
numeric alpha;
alpha := angle z1;
z2 = z1 shifted (10,-30);
z3 = z0 shifted (-10,-10);

pickup pencircle scaled 1pt;
drawarrow (-15,-40)--(90,-40);

path p;
p := z3..{dir alpha}z0{dir alpha}..z2;
draw p;

z4 = p intersectionpoint (z1--(80,-40));

pickup pencircle scaled 0.5pt;
draw z0--(0,-40);
draw z1--(80,-40);
pickup pencircle scaled 1pt;
draw z0--z1;
pickup pencircle scaled 4pt;
draw z0 withcolor white;
draw z1 withcolor white;
draw z4 withcolor white;
pickup pencircle scaled 3pt;
draw z0;
draw z1;
draw z4;

label.bot(btex $x \mathstrut$ etex, (0,-40));
label.bot(btex $x+\Delta x \mathstrut$ etex, (80,-40));
label.ulft(btex $y(x)$ etex, z0);
label.rt(btex $y(x) + y'(x)\cdot \Delta x$ etex, z1);
label.urt(btex $y(x + \Delta x)$ etex, z4);

endfig;

%
% 
%
beginfig(3)

numeric unit;
unit := 100;

numeric q;
q = 0.99;

z0 = (       0,        0);
z1 = (2 * unit,        0);
z2 = (       0, 1 * unit);

numeric yvalue;
yvalue = 1;
path p;
p = z0;
for k = 1 step 1 until 200:
	yvalue := yvalue * q;
	p := p..(k, (1 - yvalue) * unit);
endfor;
pickup pencircle scaled 1.5pt;
draw p withcolor red;

pickup pencircle scaled 1pt;
drawarrow (z0 shifted (-5,0))--(z1 shifted (10,0));
drawarrow (z0 shifted (0,-5))--(z2 shifted (0,10));

label.rt(btex relativer Fehler etex, z2 shifted (0,5));
label.top(btex $k$ etex, z1 shifted (5,0));

endfig;

%
% Runge-Kutta-Verfahren
%
beginfig(4)

def f(expr z) =
	(ypart z, -xpart z)
enddef;

numeric u;
u := 300;

z0 = (        0,        0);
z1 = (-0.15 * u,        0);
z2 = ( 0.80 * u,        0);
z3 = (        0, 0.60 * u);
z4 = (        0, 1.10 * u);

def halfcircle(expr z, w) =
	path p;
	p := z rotated 90;
	for a = 89 step -1 until -90:
		p := p--(z rotated a);
	endfor;
	pickup pencircle scaled w;
	draw p withcolor red;
enddef;

for r = 0.1 step 0.025 until 1.5:
	halfcircle((0, u * r), 0.3pt);
endfor;
halfcircle((0,u), 1pt);

clip currentpicture to (z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)--(z1 shifted z4)--cycle;

numeric h;
h := 0.75;
numeric hh;
hh := 0.2;
z10 = (0,1) rotated 3;
               z20 = z10;       z30 = z20;
z11 = f(z30);  z21 = z10 + hh * z11; z31 = z20 + 0.5 * h * z11;
z12 = f(z31);  z22 = z10 + hh * z12; z32 = z20 + 0.5 * h * z12;
z13 = f(z32);  z23 = z10 + hh * z13; z33 = z20 +       h * z13;
z14 = f(z33);  z24 = z10 + hh * z14;

z40 = (z11 + 2 * z12 + 2 * z13 + z14);
z35 = z10 + z40 * h/6;

draw (z10--z35) scaled u withcolor green;

draw      (z20--z31) scaled u withcolor 0.9;
drawarrow (z20--z21) scaled u; label.top(btex $k_1$ etex, z21 scaled u);

draw      (z20--z32) scaled u withcolor 0.9;
drawarrow (z20--z22) scaled u; label.top(btex $k_2$ etex, z22 scaled u);

draw      (z20--z33) scaled u withcolor 0.9;
drawarrow (z20--z23) scaled u; label.bot(btex $k_3$ etex, z23 scaled u);

drawarrow (z20--z24) scaled u; label.bot(btex $k_4$ etex, z24 scaled u);
%drawarrow (z20--z23) scaled u; label.top(btex $k_3$ etex, z23 scaled u);
%drawarrow (z20--z24) scaled u; label.top(btex $k_4$ etex, z24 scaled u);

z51 = f(z31);
drawarrow (z31--(z31 shifted (hh * z51))) scaled u
	withcolor blue;
label.urt(btex $k_2$ etex, z31 shifted (hh * z51) scaled u) withcolor blue;

z52 = f(z32);
drawarrow (z32--(z32 shifted (hh * z52))) scaled u
	withcolor blue;
label.urt(btex $k_3$ etex, z32 shifted (hh * z52) scaled u) withcolor blue;

z53 = f(z33);
drawarrow (z33--(z33 shifted (hh * z53))) scaled u
	withcolor blue;
label.urt(btex $k_4$ etex, z33 shifted (hh * z53) scaled u) withcolor blue;

label.top(btex $y_k$ etex, z10 scaled u);
label.urt(btex $y_{k+1}$ etex, z35 scaled u);

label.urt(btex $y_k + \frac{h}2k_1$ etex, z31 scaled u);
label.urt(btex $y_k + \frac{h}2k_2$ etex, z32 scaled u);
label.llft(btex $y_k + hk_3$ etex, z33 scaled u);

pickup pencircle scaled 4pt;

draw z10 scaled u;
draw z31 scaled u;
draw z32 scaled u;
draw z33 scaled u;
%draw z20 scaled u;
%draw z31 scaled u;
%draw z32 scaled u;
%draw z33 scaled u;

draw z35 scaled u withcolor green;

pickup pencircle scaled 2.5pt;

draw z10 scaled u withcolor white;
draw z31 scaled u withcolor white;
draw z32 scaled u withcolor white;
draw z33 scaled u withcolor white;
%draw z20 scaled u withcolor white;
%draw z31 scaled u withcolor white;
%draw z32 scaled u withcolor white;
%draw z33 scaled u withcolor white;

draw z35 scaled u withcolor white;

pickup pencircle scaled 1pt;

%drawarrow (z0 shifted (-10,0))--(z1 shifted (10,0));
%drawarrow (z0 shifted (0,-10))--(z2 shifted (0,10));

endfig;

%
% Differentialgleichung der Kettenlinie
%
beginfig(5)

numeric u;
u := 80;

def exp(expr x) =
	mexp(x * 256)
enddef;
def sinh(expr x) =
	((exp(x) - exp(-x)) / 2)
enddef;
def cosh(expr x) =
	((exp(x) + exp(-x)) / 2)
enddef;
def kette(expr x) =
	(x * u, cosh(x) * u)
enddef;

def kettepfad(expr ax, bx) =
	p := kette(ax);
	for x = ax + 0.01 step 0.01 until bx:
		p := p--kette(x);
	endfor;
	p := p--kette(bx);
enddef;

numeric startx, endx;
startx := -1.5;
endx := 1.5;
path lightp;
kettepfad(startx, endx);
lightp := p;
path darkp;
kettepfad(-0.7, 0.2);
darkp := p;

pickup pencircle scaled 0.7pt;
draw lightp;


z0 = (0,0);
z1 = (startx * u, 0);
z2 = (endx * u, 0);
z3 = lightp intersectionpoint ((-0.7 * u, 0)--(-0.7 * u, 10 * u));
z4 = lightp intersectionpoint (( 0.2 * u, 0)--( 0.2 * u, 10 * u));
z5 = (xpart z3, 0);
z6 = (xpart z4, 0);

pickup pencircle scaled 0.5pt;
draw z3--z5;
draw z4--z6;

pickup pencircle scaled 1pt;

draw (z5 shifted (0,-2))--(z5 shifted (0,2));
draw (z6 shifted (0,-2))--(z6 shifted (0,2));
label.bot(btex $x\mathstrut$ etex, z5);
label.bot(btex $x+\Delta x$ etex, z6);

pickup pencircle scaled 1.5pt;
draw darkp withcolor red;

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));

pickup pencircle scaled 0.3pt;

z7  = z3 shifted (-0.5 * u, 0);
z8  = z4 shifted ( 0.5 * u, 0);
z9  = z7 shifted (       0, -sinh(-0.7) * u * 0.5);
z10 = z8 shifted (       0,  sinh( 0.2) * u * 0.5);

draw z3--z7--z9--cycle;
draw z4--z8--z10--cycle;

pickup pencircle scaled 1.2pt;

drawarrow z3--z9;
drawarrow z4--z10;

label.rt(btex $Fy'(x+\Delta x)$ etex, 0.5[z8,z10]);
label.lft(btex $-Fy'(x)$ etex, 0.5[z7,z9]);
label.bot(btex $F$ etex, 0.5[z4,z8]);
label.bot(btex $F$ etex, 0.5[z3,z7]);

pickup pencircle scaled 3pt;

draw z3;
draw z4;

endfig;

%
% Newton Iteration zur Bestimmung der Kettenlinie
%
beginfig(6)

numeric u;
u := 100;

numeric a;
a := 1;

z10 = (-1, 1);
z20 = ( 2, 2);

def exp(expr x) =
	mexp(256 * x)
enddef;

def cosh(expr x) =
	((exp(x) + exp(-x)) / 2)
enddef;

def sinh(expr x) =
	((exp(x) - exp(-x)) / 2)
enddef;

def asinh(expr x) =
	(mlog(x + sqrt(1+x*x)) / 256)
enddef;

def f(expr x, m) =
	((1/a) * cosh(a * (x + 1) + asinh(m)) + 1 - (1/a) * sqrt(1 + m*m))
enddef;

def punkt(expr x, m) =
	(x * u, f(x,m) * u)
enddef;

numeric s;
s := 0.01;
def graph(expr m, c) =
	path p;
	p := punkt(-1.3,m);
	for x = -1.3 + s step s until 2.3:
		p := p--punkt(x,m);
	endfor;
	p := p--punkt(2.3,m);
	draw p withcolor c;
enddef;

pickup pencircle scaled 1pt;

graph( 0.000000, blue);
label.ulft(btex $y'(x_1)=0$ etex, punkt(-0.1,0)) withcolor blue;
graph(-0.805326, blue);
label.ulft(btex $y'(x_1)=-0.805$ etex, punkt(0.7,-0.805326) shifted (0,-4)) withcolor blue;
graph(-1.399918, blue);
label.ulft(btex $y'(x_1)=-1.399$ etex, punkt(0.7,-1.399918) shifted (0,-4)) withcolor blue;
graph(-1.618072, blue);
label.ulft(btex $y'(x_1)=-1.618$ etex, punkt(0.7,-1.618072) shifted (0,-6)) withcolor blue;
graph(-1.634721, blue);
%label.ulft(btex $m=-1.634721$ etex, punkt(0.5,-1.634721)) withcolor blue;
pickup pencircle scaled 1.5pt;
graph(-1.634801, red);
label.lrt(btex $y'(x_1)=-1.634801$ etex, punkt(0.9,-1.634801)) withcolor red;

z0 = (     0, 0    );
z1 = (-1 * u, 0    );
z2 = ( 2 * u, 0    );
z3 = (     0, 2 * u);

z4 = (-1 * u, 1 * u);
z5 = ( 2 * u, 2 * u);
z6 = (-1 * u, 2 * u);

pickup pencircle scaled 0.3pt;

draw z1--z4;
draw z2--z5;

path boundary;
boundary = (z1 shifted (-30,0))--(z2 shifted (30,0))--(z5 shifted (30,10))--(z6 shifted (-30,10))--cycle;

clip currentpicture to boundary;

label.bot(btex $x_1=-1$ etex, z1);
label.bot(btex $x_2=2$ etex, z2);
label.llft(btex $y(x_1)=y_1=1$ etex, z4);
label.rt(btex $y_2=2\color{red}=y(x_2)$ etex, z5);

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-30,0))--(z2 shifted (30,0));
drawarrow (z0 shifted (0,-10))--(z3 shifted (0,15));
draw (z1 shifted (0,-2))--(z1 shifted (0,2));
draw (z2 shifted (0,-2))--(z2 shifted (0,2));
label.top(btex $x$ etex, z2 shifted (30,0));
label.lft(btex $y$ etex, z3 shifted (0,15));

pickup pencircle scaled 5pt;
draw z4 withcolor white;
draw z5 withcolor white;

pickup pencircle scaled 3pt;

draw z4;
draw z5;

endfig;

end
