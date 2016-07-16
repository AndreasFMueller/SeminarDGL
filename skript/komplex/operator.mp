%
% operatormp -- Seitz-Kull-Operator in Metapost
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

label(btex $A$ etex, (0,0));

path circle;

numeric r;
r := 4.7;
numeric b;
b := 0.45;

circle := r * (cosd(40), sind(40));

for alpha = 41 step 1 until 370:
	circle := circle--(r * (cosd(alpha), sind(alpha)));
endfor;

path head;
head := (0,0)--(5,-3)--(0,6)--(-5,-3)--cycle;

z1 = (-0.3,-0.4);

pickup pencircle scaled b;
draw circle shifted z1;
fill head scaled 0.2 rotated 10 shifted (r,0) rotated 10 shifted z1;

endfig;

end


