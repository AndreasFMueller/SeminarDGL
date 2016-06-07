#
# exp2.m -- Euler-Verfahren für die Exponential-Funktion
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
x = 0;
h = 0.1;
global alpha = 0.5;
i = 0;
y = 1;
yrk = 1;
yab0 = exp(alpha * h);
yab1 = 1;
yeuler = 1;

function retval = f(x, y)
	global alpha;
	retval = -alpha * y;
endfunction;

printf(" %d & %.1f & %.8f & %.8f & %.8f & %.10f \\\\\n", i, x, y, yeuler, yab1, yrk);
while i < 10
	i = i + 1;
	x = i * h;
	y = exp(-alpha * x);
	# Euler
	yeuler = yeuler + h * f(x, yeuler);
	# Adams-Bashforth 2. Ordnung
	yab2 = yab1 + h * (1.5 * f(x,yab1) - 0.5 * f(x-h,yab0));
	yab0 = yab1;
	yab1 = yab2;
	# Runge-Kutta-Verfahren
	k1 = f(x, yrk);
	k2 = f(x + h/2, yrk + h/2 * k1);
	k3 = f(x + h/2, yrk + h/2 * k2);
	k4 = f(x + h, yrk + h * k3);
	yrk = yrk + h * (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
	printf(" %d & %.1f & %.8f & %.8f & %.8f & %.10f \\\\\n", i, x, y, yeuler, yab1, yrk);
end

