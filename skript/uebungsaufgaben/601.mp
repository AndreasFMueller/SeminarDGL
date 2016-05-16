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
u := 19;

def exp(expr t) =
	mexp(256 * t)
enddef;

def tanh(expr t) =
	((exp(t) - exp(-t))/(exp(t) + exp(-t)))
enddef;

def acos(expr t) =
	(3.1415 / 180) * (angle(t, sqrt(1-t*t)))
enddef;

def solution(expr t) =
	acos(-tanh(t))
enddef;

numeric l;
l := 7;
path p;
path q;
p := (-l, solution(-l));
q := (-l, -solution(-l));
numeric tstep;
tstep = 0.1;

for t = (-l + tstep) step tstep until (l - tstep/2):
	p := p--(t,  solution(t));
	q := q--(t, -solution(t));
endfor;

numeric sstep;
sstep := u;
numeric vstep;
vstep := 3.1415 * u;

pickup pencircle scaled 1pt;

for r = -3 step 1 until 3:
	for s = -15 step 1 until 15:
		draw p scaled u shifted (s * sstep, 2 * r * vstep) withcolor red;
		draw q scaled u shifted (s * sstep, 2 * r * vstep) withcolor blue;
	endfor;
endfor;
draw p scaled u withcolor red;

z0 = (               0,      0);
z1 = (-l * sqrt(2) * u,      0);
z2 = ( l * sqrt(2) * u,      0);
z3 = (               0, -l * u);
z4 = (               0,  l * u);

clip currentpicture to (z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)--(z1 shifted z4)--cycle;

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));
label.top(btex $x$ etex, z2 shifted (10,0));
label.rt(btex $y$ etex, z4 shifted (0,10));

endfig;

end
