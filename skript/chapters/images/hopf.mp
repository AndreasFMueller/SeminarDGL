%
% hopf.mp -- Hopf Bifurkation
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

def T(expr t) =
	(3.1415 * t / 180)
enddef;

def exp(expr t) =
	mexp(t * 256)
enddef;

numeric u;
u := 75;

%
% Fall b<0
%
beginfig(1)

z0 = (   0,   0);
z1 = (-1.5,   0);
z2 = ( 1.5,   0);
z3 = (   0,-1.5);
z4 = (   0, 1.5);

pickup pencircle scaled 1pt;

def r(expr t) =
	sqrt(1/(1.20 * exp(T(t)) - 1))
enddef;

numeric deltat;
deltat = 1;

for phi = 0 step 15 until 350:
	path p;
	p = r(0) * (cosd(phi), sind(phi));
	for t = deltat step deltat until 360:
		p := p--(r(t) * (cosd(phi - t), sind(phi - t)));
	endfor;
	draw p scaled u withcolor red;
endfor;


clip currentpicture to ((z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)
	--(z1 shifted z4)--cycle) scaled u;

drawarrow (z1 * u shifted (-5,0))--(z2 * u shifted (5,0));
drawarrow (z3 * u shifted (0,-5))--(z4 * u shifted (0,5));
label.top(btex $x$ etex, z2 * u shifted (5,0));
label.rt(btex $y$ etex, z4 * u shifted (0,5));

endfig;

%
% Phasenportraits für die Hopf-Bifurkation
%
% Fall b=0
%
beginfig(2)

z0 = (   0,   0);
z1 = (-1.5,   0);
z2 = ( 1.5,   0);
z3 = (   0,-1.5);
z4 = (   0, 1.5);

pickup pencircle scaled 1pt;

def r(expr t) =
	1/sqrt(2*(T(t)+1/10))
enddef;

for phi = 0 step 15 until 350:
	path p;
	p = r(0) * (cosd(phi), sind(phi));
	for t = 1 step 1 until 1000:
		p := p--(r(t) * (cosd(phi - t), sind(phi - t)));
	endfor;
	pickup pencircle scaled 1.0pt;
	draw p scaled u withcolor red;
endfor;

clip currentpicture to ((z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)
	--(z1 shifted z4)--cycle) scaled u;

drawarrow (z1 * u shifted (-5,0))--(z2 * u shifted (5,0));
drawarrow (z3 * u shifted (0,-5))--(z4 * u shifted (0,5));
label.top(btex $x$ etex, z2 * u shifted (5,0));
label.rt(btex $y$ etex, z4 * u shifted (0,5));

endfig;

%
% Fall b>0
%
beginfig(3)

z0 = (   0,   0);
z1 = (-1.5,   0);
z2 = ( 1.5,   0);
z3 = (   0,-1.5);
z4 = (   0, 1.5);

pickup pencircle scaled 1pt;

numeric rr;
rr = 0.5;

def r(expr t) =
	sqrt(1/(1 + (1/rr - 1)*exp(-2*T(t))))
enddef;

def ra(expr t) =
	sqrt(1/(1 - (1 - 1/8)*exp(-2*T(t))))
enddef;

path circ;
circ := (u,0);
for t = 1 step 1 until 359.5:
	circ := circ--((u,0) rotated t);
endfor;
circ := circ--cycle;
draw circ withcolor blue;

numeric l;
l = 90;

for phi = 0 step 30 until 350:
	path p;
	p := r(-2*l) * (cosd(phi+2*l), sind(phi+2*l));
	for t = -2*l+1 step 1 until l:
		p := p--(r(t) * (cosd(phi - t), sind(phi - t)));
	endfor;
	pickup pencircle scaled 1.0pt;
	draw p scaled u withcolor red;
endfor;

for phi = 0 step 15 until 350:
	path p;
	p := ra(0) * (cosd(phi), sind(phi));
	for t = 1 step 1 until l:
		p := p--(ra(t) * (cosd(phi - t), sind(phi - t)));
	endfor;
	pickup pencircle scaled 1.0pt;
	draw p scaled u withcolor red;
endfor;

clip currentpicture to ((z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)
	--(z1 shifted z4)--cycle) scaled u;

drawarrow (z1 * u shifted (-5,0))--(z2 * u shifted (5,0));
drawarrow (z3 * u shifted (0,-5))--(z4 * u shifted (0,5));
label.top(btex $x$ etex, z2 * u shifted (5,0));
label.rt(btex $y$ etex, z4 * u shifted (0,5));

endfig;

u := 36;

%
% Phasendiagramm f"ur Kreis
%
beginfig(4)

z0 = (   0,   0);
z1 = (-1.5,   0);
z2 = ( 1.5,   0);
z3 = (   0,-1.5);
z4 = (   0, 1.5);

pickup pencircle scaled 1pt;

fill (((z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)
	--(z1 shifted z4)--cycle) scaled u) withcolor (0.90,0.90,1);

drawarrow (z1 * u shifted (-5,0))--(z2 * u shifted (5,0));
drawarrow (z3 * u shifted (0,-5))--(z4 * u shifted (0,5));
label.top(btex $x$ etex, z2 * u shifted (5,0));
label.rt(btex $y$ etex, z4 * u shifted (0,5));

label.bot(btex $b < 0$ etex, z3 scaled u shifted (0,-5));

endfig;

%
% Phasendiagramm f"ur Kreis
%
beginfig(5)

z0 = (   0,   0);
z1 = (-1.5,   0);
z2 = ( 1.5,   0);
z3 = (   0,-1.5);
z4 = (   0, 1.5);

pickup pencircle scaled 1pt;

fill (((z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)
	--(z1 shifted z4)--cycle) scaled u) withcolor (0.90,0.90,1);
pickup pencircle scaled 1pt;

drawarrow (z1 * u shifted (-5,0))--(z2 * u shifted (5,0));
drawarrow (z3 * u shifted (0,-5))--(z4 * u shifted (0,5));
label.top(btex $x$ etex, z2 * u shifted (5,0));
label.rt(btex $y$ etex, z4 * u shifted (0,5));

pickup pencircle scaled 4pt;
draw z0 withcolor red;

label.bot(btex $b = 0$ etex, z3 scaled u shifted (0,-5));

endfig;

%
% Phasendiagramm f"ur Kreis
%
beginfig(6)

z0 = (   0,   0);
z1 = (-1.5,   0);
z2 = ( 1.5,   0);
z3 = (   0,-1.5);
z4 = (   0, 1.5);

pickup pencircle scaled 1pt;

path circ;
circ := (u,0);
for t = 1 step 1 until 359.5:
	circ := circ--((u,0) rotated t);
endfor;
circ := circ--cycle;

fill (((z1 shifted z3)--(z2 shifted z3)--(z2 shifted z4)
	--(z1 shifted z4)--cycle) scaled u) withcolor (0.90,0.90,1);
fill circ withcolor (1,0.90,0.90);

drawarrow (z1 * u shifted (-5,0))--(z2 * u shifted (5,0));
drawarrow (z3 * u shifted (0,-5))--(z4 * u shifted (0,5));
label.top(btex $x$ etex, z2 * u shifted (5,0));
label.rt(btex $y$ etex, z4 * u shifted (0,5));

label.bot(btex $b > 0$ etex, z3 scaled u shifted (0,-5));

endfig;

end
