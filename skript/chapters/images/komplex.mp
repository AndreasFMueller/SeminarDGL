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

%
% Pfad zur Definition der Laurent-Reihe
%
beginfig(3)

numeric u;
u := 100;

z0 = (0,0);
z1 = (-u, 0);
z2 = (2*u, 0);
z3 = (0,-u);
z4 = (0,1.7*u);

numeric smallradius, largeradius;
smallradius := 0.07 * u;
largeradius := 1.2 * u;
numeric w;
w := 1.0;
numeric outerangle;
outerangle := angle(sqrt(largeradius*largeradius - w*w), w);
show outerangle;
numeric innerangle;
innerangle := angle(sqrt(smallradius*smallradius - w*w), w);
show innerangle;

z5 = (0.6 * u, 0.4 * u);
z6 = (largeradius, 0);
z7 = (smallradius, 0);

label(btex $\mathbb C$ etex, z1 shifted z4);

path innercircle;
innercircle := z7 rotated (360 - innerangle);
for a = 360 - innerangle - 1 step -1 until innerangle + 1:
	innercircle := innercircle--(z7 rotated a);
endfor;
innercircle := innercircle--(z7 rotated innerangle);

path outercircle;
outercircle := z6 rotated outerangle;
for a = outerangle + 1 step 1 until 360 - outerangle - 1:
	outercircle := outercircle--(z6 rotated a);
endfor;
outercircle := outercircle--(z6 rotated (360 - outerangle));

path p;
p := (outercircle--innercircle--cycle) shifted z5;

fill p withcolor (1,0.95,0.95);

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

z11 = (z1--z0) intersectionpoint (outercircle shifted z5);
z12 = (z0--z2) intersectionpoint (outercircle shifted z5);
z13 = (z3--z0) intersectionpoint (outercircle shifted z5);
z14 = (z0--z4) intersectionpoint (outercircle shifted z5);

draw z11--z12 withcolor 0.9;
draw z13--z14 withcolor 0.9;

pickup pencircle scaled 1.5pt;

draw p withcolor red;

pickup pencircle scaled 1pt;

z8 = z5 shifted (0.3 * u, 0.5 * u);

pickup pencircle scaled 5pt;
draw z8;
draw z5;
pickup pencircle scaled 3pt;
draw z8 withcolor white;
draw z5 withcolor white;
label.urt(btex $z$ etex, z8);
label.llft(btex $z_0$ etex, z5 shifted (-0.05*u, -0.05*u));

label.top(btex Re etex, z2 shifted (10,0));
label.rt(btex Im etex, z4 shifted (0,10));

z9 = (point 45 of outercircle) shifted z5;
z10 = (point 270 of innercircle) shifted z5;

label.urt(btex $\gamma_1$ etex, z9) withcolor red;
label.top(btex $\gamma_2$ etex, z10) withcolor red;

endfig;

%
% Wegintegral zum Satz 7.9
%
beginfig(4)

numeric u;
u := 60;

z0 = (   0,      0);
z1 = (-2*u,      0);
z2 = ( 2*u,      0);
z3 = (   0, -1.4*u);
z4 = (   0,  1.4*u);

path p;

z10 = (0, -0.7 * u);
z11 = (u, -1.4 * u);
z15 = (1.6 * u, 0);
z12 = (u, u);
z13 = (-0.5 * u, u);
z14 = (-1 * u, -u);
z16 = (-1.5 * u, 0.2 * u);

p := z16..z14..z10{dir 0}..z11..z15..z12..z13;
pickup pencircle scaled 1.5pt;
draw p withcolor red;
label.ulft(btex $\gamma$ etex, point 3.5 of p) withcolor red;

path q;
q = z10;
for a = 1 step 1 until 360:
	q := q--(z10 rotated a);
endfor;
q := q--cycle;
pickup pencircle scaled 0.5pt;
fill q withcolor (1,0.95,0.95);
draw q withcolor red;

z5 = point 300 of q;
drawarrow z0--z5;
label.lrt(btex $\varrho$ etex, 0.7[z0,z5]);

pickup pencircle scaled 1pt;
drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

label.top(btex Re etex, z2 shifted (10,0));
label.rt(btex Im etex, z4 shifted (0,10));
label(btex $\mathbb C$ etex, z1 shifted z4);

z6 = (0.4 * u, 0.2 * u);
pickup pencircle scaled 4pt;
draw z6;
pickup pencircle scaled 3pt;
draw z6 withcolor white;
label.top(btex $z$ etex, z6 shifted (0,1));

endfig;

%
% Wegintegral, analytische Forsetzung von y' = 1/z
%
beginfig(5)

numeric u;
u := 60;
numeric r;
r := 1.2 * u;

z0 = (     0,        0);
z1 = (-2 * u,        0);
z2 = ( 2 * u,        0);
z3 = (     0, -1.4 * u);
z4 = (     0,  1.4 * u);

z5 = (-u,  0);
z6 = ( u,  0);
z7 = ( 0, -u);
z8 = ( 0,  u);
z9 = r * (cosd(60), sind(60));

pickup pencircle scaled 1pt;

path q;
q = z0;
for a = 0 step 1 until 60:
	q := q--(0.4 * r * cosd(a), 0.4 * r * sind(a));
endfor;
q := q--cycle;
fill q withcolor (0.95,0.95,0.95);
draw z0--z9;
label(btex $t$ etex, 0.27 * r * (cosd(30), sind(30)));

path p;
p = (r,0);
for a = 1 step 1 until 355:
	p := p--(r * (cosd(a), sind(a)));
endfor;
drawarrow p withcolor red;

drawarrow (z1 shifted (-10,0))--(z2 shifted (10,0));
drawarrow (z3 shifted (0,-10))--(z4 shifted (0,10));

draw (z5 shifted (0,-2))--(z5 shifted (0,2));
draw (2 * z5 shifted (0,-2))--(2 * z5 shifted (0,2));
draw (z6 shifted (0,-2))--(z6 shifted (0,2));
draw (2 * z6 shifted (0,-2))--(2 * z6 shifted (0,2));
draw (z7 shifted (-2,0))--(z7 shifted (2,0));
draw (z8 shifted (-2,0))--(z8 shifted (2,0));

label.bot(btex $-1$ etex, z5);
label.bot(btex $-2$ etex, 2 * z5);
label.bot(btex $1$ etex, z6);
label.bot(btex $2$ etex, 2 * z6);
label.rt(btex $1$ etex, z8);
label.rt(btex $-1$ etex, z7);

label.urt(btex $\displaystyle y(\gamma(t)) = \int_{\gamma|[0,t]}  \frac1z\,dz$ etex,
	z9 shifted (0, -7));

def punkt(expr z, c) =
pickup pencircle scaled 4pt;
draw z withcolor c;
pickup pencircle scaled 2.5pt;
draw z withcolor white;
enddef;

punkt((r,0), black);

punkt(z9, red);

z10 = r * (cosd(135), sind(135));

label.urt(btex $y(r)=\log(r)$ etex, (r,0));
label.ulft(btex $y(\gamma(\frac34\pi))=\log(r) + \frac34\pi i$ etex, z10);
punkt(z10, red);

z11 = r * (cosd(14/10 * 180), sind(14/10 * 180));

label.llft(btex $y(\gamma(\frac{7}{5}\pi)) = \log(r) + \frac75\pi i$ etex, z11);
punkt(z11, red);

z12 = r * (cosd(119/60 * 180), sind(119/60 * 180));
z13 = z12 shifted (10,-10);
z14 = z13 shifted (0, -0.8 * u);
label.bot(btex $y(\gamma(\frac{119}{60}\pi)) = \log(r) + \frac{119}{60}\pi i$ etex, z14);
pickup pencircle scaled 0.5pt;
draw z12--z13--z14 withcolor red;
punkt(z12, red);

label.rt(btex Re etex, z2 shifted (10,0));
label.top(btex Im etex, z4 shifted (0,10));

endfig;

%
%
%
%beginfig(5)
%
%endfig;

end
