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

end
