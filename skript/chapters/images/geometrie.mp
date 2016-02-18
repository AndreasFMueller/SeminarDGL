%
% geometrie.mp -- Darstellungen zur Geometrie
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
% Kurven, die durch einen 
%
beginfig(1)

numeric u;
u := 31;
numeric m;
m := 4;
numeric s;
s := 1.0;

def kurvep(expr c) =
	path	p;
	p := (c, 0);
	for t = 0 step 0.01 until m:
		p := p--(c + t, (t/2) * (t/2));
	endfor;
enddef;

def kurvem(expr c) =
	path	p;
	p := (c, 0);
	for t = 0 step 0.01 until m:
		p := p--(c - t, -(t/2) * (t/2));
	endfor;
enddef;

pickup pencircle scaled 1.5pt;
for c = -8 step s until 12:
	kurvep(c);
	draw p scaled u withcolor red;
	kurvem(c);
	draw p scaled u withcolor red;
endfor;

pickup pencircle scaled 3pt;

kurvep(0);
draw p scaled u withcolor red;
kurvem(0);
draw p scaled u withcolor red;

clip currentpicture to (((-4, -4)--(8, -4)--(8,4)--(-4,4)--cycle) scaled u);

z0 = (   0,    0);
z1 = (-4*u,    0);
z2 = ( 8*u,    0);
z3 = (   0, -4*u);
z4 = (   0,  4*u);

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

pickup pencircle scaled 2.5pt;

kurvem(1.5);
draw p scaled u withcolor blue;
kurvep(3.5);
draw p scaled u withcolor blue;
draw (1.5*u,0)--(3.5*u,0) withcolor blue;

label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $y$ etex, z4 shifted (0,10));

endfig;

%
% Phasenporträts für positive Eigenwerte
%
vardef punkt(expr lambdaeins, lambdazwei, z, t) =
	((xpart z) * mexp(t * lambdaeins), (ypart z) * mexp(t * lambdazwei))
enddef;

def pfad(expr lambdaeins, lambdazwei, z) =
	path	p;
	p := punkt(lambdaeins, lambdazwei, z, 0);
	for t = -10 step -10 until -700:
		p := p--punkt(lambdaeins, lambdazwei, z, t);
	endfor;
	draw p scaled u withcolor red;
enddef;

numeric	u;
u := 50;

def portrait(expr lambdaeins, lambdazwei) =
	pickup pencircle scaled 1.5pt;
	for yoffset = -1 step 0.4 until 1:
		pfad(lambdaeins, lambdazwei, ( 1, yoffset));
		pfad(lambdaeins, lambdazwei, (-1, yoffset));
		pfad(lambdaeins, lambdazwei, ( 1,-yoffset));
		pfad(lambdaeins, lambdazwei, (-1,-yoffset));
	endfor;
	for xoffset = -0.6 step 0.4 until 0.6:
		pfad(lambdaeins, lambdazwei, ( xoffset, 1));
		pfad(lambdaeins, lambdazwei, (-xoffset, 1));
		pfad(lambdaeins, lambdazwei, ( xoffset,-1));
		pfad(lambdaeins, lambdazwei, (-xoffset,-1));
	endfor;
	pickup pencircle scaled 1pt;
	drawarrow (-u-10,0)--(u+10,0);
	drawarrow (0,-u-10)--(0,u+10);
	label.top(btex $y_1$ etex, (u+10,0));
	label.rt(btex $y_2$ etex, (0,u+10));
enddef;

beginfig(2)
portrait(2, 1);
endfig;

beginfig(3)
portrait(1, 1);
endfig;

beginfig(4)
portrait(1, 2);
endfig;

def pfad(expr lambdaeins, lambdazwei, z) =
	path	p;
	p := punkt(lambdaeins, lambdazwei, z, -500);
	for t = -490 step 10 until 500:
		p := p--punkt(lambdaeins, lambdazwei, z, t);
	endfor;
	draw p scaled u withcolor red;
enddef;

def portrait(expr lambdaeins, lambdazwei) =
	pickup pencircle scaled 1.5pt;
	for a = 0.2 step 0.2 until 0.8:
		pfad(lambdaeins, lambdazwei, ( a,  a));
		pfad(lambdaeins, lambdazwei, (-a,  a));
		pfad(lambdaeins, lambdazwei, ( a, -a));
		pfad(lambdaeins, lambdazwei, (-a, -a));
	endfor;
	clip currentpicture to (-u,-u)--(u,-u)--(u,u)--(-u,u)--cycle;
	pickup pencircle scaled 1pt;
	drawarrow (-u-10,0)--(u+10,0);
	drawarrow (0,-u-10)--(0,u+10);
	label.top(btex $y_1$ etex, (u+10,0));
	label.rt(btex $y_2$ etex, (0,u+10));
enddef;

beginfig(5)
portrait(-3, 1);
endfig;

beginfig(6)
portrait(-1, 1);
endfig;

beginfig(7)
portrait(-1, 3);
endfig;

%
% jordan normalform mit nur einem eigenvektor
%
vardef punkt(expr lambda, z, t) =
	((((xpart z) + (ypart z) * t), ypart z) * mexp(lambda * t))
enddef;

numeric	r;
r := 4;
numeric s;
s := 0.01;

def pfad(expr lambda, z) =
	path	p;
	p := punkt(lambda, z, -r);
	for t = (-r+s) step s until 2*r:
		p := p--punkt(lambda, z, t);
	endfor;
	pickup pencircle scaled 1.5pt;
	draw p scaled u withcolor red;
%	pickup pencircle scaled 4pt;
%	draw punkt(lambda, z, 0) scaled u withcolor red;
enddef;

def portrait(expr lambda) =
	pickup pencircle scaled 1.5pt;
	for a = 0.1 step 0.1 until 1.0:
		pfad(lambda, ( a, -0.2 * a));
		pfad(lambda, (-a,  0.2 * a));
	endfor;
	clip currentpicture to (-u,-u)--(u,-u)--(u,u)--(-u,u)--cycle;
	pickup pencircle scaled 1pt;
	drawarrow (-u-10,0)--(u+10,0);
	drawarrow (0,-u-10)--(0,u+10);
	label.top(btex $y_1$ etex, (u+10,0));
	label.rt(btex $y_2$ etex, (0,u+10));
enddef;

beginfig(8)
portrait(128);
endfig;

%
% Wirbel um den Nullpunkt
%
vardef punkt(expr alpha, z, t) =
	((mexp(alpha * t), 0) rotated (t + angle z))
enddef;

numeric a;
a := 360;

def pfad(expr alpha, z) =
	path	p;
	p := punkt(alpha, z, -a);
	for t = -a + 5 step 5 until 360:
		p := p--punkt(alpha, z, t);
	endfor;
	pickup pencircle scaled 1.5pt;
	draw p scaled u withcolor red;
enddef;

def portrait(expr alpha) =
	for delta = 0 step 30 until 330:
		pfad(alpha, (1,0) rotated delta);
	endfor;
	clip currentpicture to (-u,-u)--(u,-u)--(u,u)--(-u,u)--cycle;
	pickup pencircle scaled 1pt;
	drawarrow (-u-10,0)--(u+10,0);
	drawarrow (0,-u-10)--(0,u+10);
	label.top(btex $y_1$ etex, (u+10,0));
	label.rt(btex $y_2$ etex, (0,u+10));
enddef;

beginfig(9)
portrait(2);
endfig;

beginfig(10)
portrait(-2);
endfig;

def circle(expr r) =
	path	p;
	p := (r, 0);
	for t = 10 step 10 until 350:
		p := p--((r,0) rotated t);
	endfor;
	p := p--cycle;
	pickup pencircle scaled 1.5pt;
	draw p scaled u withcolor red;
enddef;

beginfig(11)
	for r = 0.2 step 0.2 until 1.4:
		circle(r);
	endfor;
	clip currentpicture to (-u,-u)--(u,-u)--(u,u)--(-u,u)--cycle;
	pickup pencircle scaled 1pt;
	drawarrow (-u-10,0)--(u+10,0);
	drawarrow (0,-u-10)--(0,u+10);
	label.top(btex $y_1$ etex, (u+10,0));
	label.rt(btex $y_2$ etex, (0,u+10));
endfig;

end
