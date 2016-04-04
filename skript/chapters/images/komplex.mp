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

def disk(expr z, r) =
	path p;
	p := (z shifted (r, 0));
	for theta = 1 step 1 until 359:
		p := p--(z shifted ((r,0) rotated theta));
	endfor;
	p := p--cycle;
	fill p withcolor gray;
enddef;

def kreis(expr z, r, c) =
	path p;
	p := (z shifted (r, 0));
	for theta = 1 step 1 until 359:
		p := p--(z shifted ((r,0) rotated theta));
	endfor;
	p := p--cycle;
	pickup pencircle scaled 0.7pt;
	draw p withcolor c;
enddef;

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

kreis(z10, 0.6 * u, black);
kreis(z11, 0.7 * u, black);
kreis(z12, 0.6 * u, black);
kreis(z13, 0.6 * u, black);
kreis(z14, 0.9 * u, black);
kreis(z15, 0.8 * u, black);
kreis(z16, 0.7 * u, black);

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.top(btex $\text{Re}$ etex, z2 shifted (10,0));
label.rt(btex  $\text{Im}$ etex, z4 shifted (0,10));

label(btex $\mathbb C$ etex, z4 shifted z1);

label.rt(btex $\gamma$ etex, point 2.1 of gamma) withcolor rot;
label.ulft(btex $z_0$ etex, z10) withcolor rot;
label.llft(btex $z_1$ etex, z16) withcolor rot;

endfig;

%
% Beispiel f"ur analytische Fortsetzung
%
beginfig(2)

numeric u;
u := 70;

z0 = (0,0);
z1 = (-2 * u,0);
z2 = (2 * u, 0);
z3 = (0, -2 * u);
z4 = (0, 2 * u);

z5 = (u,0);
z6 = (0,u);
z7 = (-u, 0);
z8 = (0,-u);

disk(z5, u);
disk(z6, u);
disk(z7, u);
disk(z8, u);

pickup pencircle scaled 1pt;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

kreis(z5, u, black);
kreis(z6, u, black);
kreis(z7, u, black);
kreis(z8, u, black);

kreis(z0, u, green);
 
label.urt(btex $\gamma_+$ etex, z5 rotated 80) withcolor green;
label.lrt(btex $\gamma_-$ etex, z5 rotated -80) withcolor green;

pickup pencircle scaled 4pt;
draw z5;
draw z6;
draw z7;
draw z8;
pickup pencircle scaled 3pt;
draw z5 withcolor white;
draw z6 withcolor white;
draw z7 withcolor white;
draw z8 withcolor white;

label.urt(btex $1$ etex, z5);
label.ulft(btex $i$ etex, z6);
label.ulft(btex $-1$ etex, z7);
label.llft(btex $-i$ etex, z8);

z10 = 0.5[z5,z6];
z11 = 0.5[z6,z7];
z12 = 0.5[z7,z8];
z13 = 0.5[z8,z5];

pickup pencircle scaled 5pt;
draw z10 withcolor rot;
draw z11 withcolor rot;
draw z12 withcolor rot;
draw z13 withcolor rot;
pickup pencircle scaled 3pt;
draw z10 withcolor white;
draw z11 withcolor white;
draw z12 withcolor white;
draw z13 withcolor white;

label.top(btex $\displaystyle(1+i)\frac{\sqrt{2}}2$ etex, z10) withcolor red;
label.bot(btex $\displaystyle(1-i)\frac{\sqrt{2}}2$ etex, z13 shifted (5,0)) withcolor red;
label.top(btex $\displaystyle(-1+i)\frac{\sqrt{2}}2$ etex, z11 shifted (-10,0)) withcolor red;
label.bot(btex $\displaystyle(-1-i)\frac{\sqrt{2}}2$ etex, z12 shifted (-10,0)) withcolor red;

label.top(btex Re etex, z2 shifted (10,0));
label.rt(btex Im etex, z4 shifted (0,10));

label(btex $\mathbb C$ etex, z4 shifted z1);

pickup pencircle scaled 20pt;
draw z0;
pickup pencircle scaled 18pt;
draw z0 withcolor white;

endfig;

end
