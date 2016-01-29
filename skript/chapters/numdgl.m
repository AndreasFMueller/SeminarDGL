#
# numdgl.m -- numerische loesung einer gewoehnlichen Differentialgleichung
#             mit Octave
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
global omega = 0.01;

function yprime = f(y, x)
	global omega;
	yprime = [ y(2); -y(1) + sin(omega * x) ];
endfunction

function y = yexakt(x)
	global omega;
	y = (1 / (omega^2 - 1)) * (omega * sin(x) - sin(omega * x));
endfunction

n = 10000;
y0 = zeros(2,1);
deltax = 1;
x = (0:n) * deltax;

format long;

l = zeros(n+1, 5);
l(:,1) = x;
l(:,2:3) = lsode("f", y0, x);
l(:,4) = yexakt(x);
l(:,5) = abs(l(:,2) - l(:,4));

for i = 1 + 100 * (0:n/100)
	printf("%5.0f&%12.8f&%12.8f&%12.8f\\\\\n", l(i,1), l(i,2), l(i,4), l(i,5))
endfor


