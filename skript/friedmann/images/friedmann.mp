%
% friedmann.mp -- Graphs for paper on Friedmann equation
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

beginfig(1)

numeric a, A;
a := 14;
A := 1.5 * a;

z0 = (0,0);

z1 = (-7 * a, 0);
z2 = ( 7 * a, 0);

def spunkt(expr p) =
	((p scaled a) shifted z1)
enddef;

def lpunkt(expr p) = 
	((p scaled A) shifted z2)
enddef;

z10 = spunkt((2,1));
z11 = spunkt((3,1));
z12 = spunkt((3,2));
z13 = spunkt((2,2));
fill z10--z11--z12--z13--cycle withcolor 0.7;
label(btex $\mu$ etex, 0.5[z10,z12]);

z20 = lpunkt((2,1));
z21 = lpunkt((3,1));
z22 = lpunkt((3,2));
z23 = lpunkt((2,2));
fill z20--z21--z22--z23--cycle withcolor 0.9;
label(btex $\mu$ etex, 0.5[z20,z22]);

pickup pencircle scaled 0.7pt;
for x = -5 step 1 until 5:
	draw spunkt((x,-5.5))--spunkt((x,5.5)) dashed dashpattern(off 2 on 0);
	draw spunkt((-5.5,x))--spunkt((5.5,x)) dashed dashpattern(off 2 on 0);
endfor;
for x = -3 step 1 until 3:
	draw lpunkt((x,-3.5))--lpunkt((x,3.5)) dashed dashpattern(off 3 on 0);
	draw lpunkt((-3.5,x))--lpunkt((3.5,x)) dashed dashpattern(off 3 on 0);
endfor;

z30 = spunkt((1,-3)) shifted (1,1);
z31 = spunkt((4,-3)) shifted (-1,1);
z32 = spunkt((4,-2)) shifted (-1,-1);
z33 = spunkt((1,-2)) shifted (1,-1);
fill z30--z31--z32--z33--cycle withcolor white;
z40 = lpunkt((1,-3)) shifted (1,1);
z41 = lpunkt((4,-3)) shifted (-1,1);
z42 = lpunkt((4,-2)) shifted (-1,-1);
z43 = lpunkt((1,-2)) shifted (1,-1);
fill z40--z41--z42--z43--cycle withcolor white;

pickup pencircle scaled 1pt;
drawarrow spunkt((-6,0))--spunkt((6,0));
drawarrow spunkt((0,-6))--spunkt((0,6));
drawarrow lpunkt((-4,0))--lpunkt((4,0));
drawarrow lpunkt((0,-4))--lpunkt((0,4));

pickup pencircle scaled 1.5pt;

draw spunkt((-2,-2))--spunkt((1,2)) withcolor 0.8;
draw lpunkt((-2,-2))--lpunkt((1,2)) withcolor 0.8;

pickup pencircle scaled 7pt;

draw spunkt((-2,-2)) withcolor blue;
draw lpunkt((-2,-2)) withcolor blue;
draw spunkt((1,2)) withcolor red;
draw lpunkt((1,2)) withcolor red;

draw spunkt((-3,0)) withcolor green;
draw lpunkt((-3,0)) withcolor green;
draw spunkt((-2,3)) withcolor green;
draw lpunkt((-2,3)) withcolor green;
draw spunkt((2,4)) withcolor green;
draw spunkt((1,-3)) withcolor green;
draw lpunkt((1,-3)) withcolor green;

draw spunkt((0,0)) withcolor green;
draw lpunkt((0,0)) withcolor green;

draw spunkt((3,-1)) withcolor green;
draw lpunkt((3,-1)) withcolor green;

draw spunkt((-4,5)) withcolor green;
draw spunkt((5,2)) withcolor green;
draw spunkt((4,-5)) withcolor green;
draw spunkt((-4,-4)) withcolor green;
draw spunkt((-5,-2)) withcolor green;
draw spunkt((0,-5)) withcolor green;
draw spunkt((5,5)) withcolor green;

label.ulft(btex $A$ etex, spunkt((-2,-2)));
label.urt(btex $B$ etex, spunkt((1,2)));
label.ulft(btex $A$ etex, lpunkt((-2,-2)));
label.urt(btex $B$ etex, lpunkt((1,2)));

pickup pencircle scaled 1.5pt;
z3 = spunkt((2,-3));
z4 = spunkt((3,-3));
z5 = 0.5[z3,z4];
z6 = lpunkt((2,-3));
z7 = lpunkt((3,-3));
z8 = 0.5[z6, z7];

def scalefactor(expr zone, ztwo) =
draw zone--ztwo;
draw (zone shifted (0,-2))--(zone shifted (0,2));
draw (ztwo shifted (0,-2))--(ztwo shifted (0,2));
enddef;

scalefactor(z3, z4);
scalefactor(z6, z7);

label.top(btex $a(t_0) = a$ etex, z5);
label.top(btex $a(t_1) = 1.5a$ etex, z8);

endfig;

end


