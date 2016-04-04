%
% komplex.mp -- stochastische Prozesse
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
% 
%
beginfig(1)

numeric u;
u := 80;

z0 = (       0,     0);
z1 = (-1   * u,     0);
z2 = ( 3.3 * u,     0);
z3 = (       0,-1 * u);
z4 = (       0, 3 * u);

pickup pencircle scaled 1pt;

color gray;
gray := (0.95,0.95,0.95);
color rot;
rot := (0.8,0,0);

def disk(expr z, r) =
	path p;
	p := (z shifted (r, 0));
	for theta = 1 step 1 until 359:
		p := p--(z shifted ((r,0) rotated theta));
	endfor;
	p := p--cycle;
	fill p withcolor gray;
enddef;

def kreis(expr z, r) =
	path p;
	p := (z shifted (r, 0));
	for theta = 1 step 1 until 359:
		p := p--(z shifted ((r,0) rotated theta));
	endfor;
	p := p--cycle;
	pickup pencircle scaled 0.7pt;
	draw p;
enddef;

path gamma;
gamma := (0,0)..(1.5*u,-0.2*u)..(2.5*u,u)..(0.5*u,2*u);

z10 = point 0.0 of gamma;
z11 = point 0.5 of gamma;
z12 = point 1.0 of gamma;
z13 = point 1.5 of gamma;
z14 = point 2.0 of gamma;
z15 = point 2.5 of gamma;
z16 = point 3.0 of gamma;

disk(z10, 0.6 * u);
disk(z11, 0.7 * u);
disk(z12, 0.6 * u);
disk(z13, 0.6 * u);
disk(z14, 0.9 * u);
disk(z15, 0.8 * u);
disk(z16, 0.7 * u);

pickup pencircle scaled 1.5pt;
draw gamma withcolor rot;

pickup pencircle scaled 4.5pt;

draw z10 withcolor rot;
draw z11 withcolor rot;
draw z12 withcolor rot;
draw z13 withcolor rot;
draw z14 withcolor rot;
draw z15 withcolor rot;
draw z16 withcolor rot;

pickup pencircle scaled 3pt;

draw z10 withcolor gray;
draw z11 withcolor gray;
draw z12 withcolor gray;
draw z13 withcolor gray;
draw z14 withcolor gray;
draw z15 withcolor gray;
draw z16 withcolor gray;

kreis(z10, 0.6 * u);
kreis(z11, 0.7 * u);
kreis(z12, 0.6 * u);
kreis(z13, 0.6 * u);
kreis(z14, 0.9 * u);
kreis(z15, 0.8 * u);
kreis(z16, 0.7 * u);

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.top(btex $\text{Re}$ etex, z2 shifted (10,0));
label.rt(btex  $\text{Im}$ etex, z4 shifted (0,10));

label(btex $\mathbb C$ etex, z4 shifted z1);

label.rt(btex $\gamma$ etex, point 2.1 of gamma) withcolor rot;
label.ulft(btex $z_0$ etex, z10) withcolor rot;
label.llft(btex $z_1$ etex, z16) withcolor rot;

endfig;

end
