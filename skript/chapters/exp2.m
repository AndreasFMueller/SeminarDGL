#
# exp2.m -- Euler-Verfahren für die Exponential-Funktion
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
y = 1;
yeuler = 1;
yimpeuler = 1;
ysimprk = 1;
yrk = 1;
x = 0;
h = 0.1/2;
global alpha = 0.5;
i = 0;

function retval = f(x, y)
	global alpha;
	retval = -alpha * y;
endfunction;

printf(" %d & %.1f & %.8f & %.8f & %.8f %.8f & %.10f \\\\\n", i, x, y, yeuler, yimpeuler, ysimprk, yrk);
while i < 20
	i = i + 1;
	x = i * h;
	y = exp(-alpha * x);
	# Euler-Verfahren
	yeuler = yeuler  + h * f(x, yeuler);
	# verbessertes Euler-Verfahren
	y1 = yimpeuler + 0.5 * h * f(x, yimpeuler);
	yimpeuler = yimpeuler + h * f(x + h/2, y1);
	# vereinfachtes Runge-Kutta-Verfahren
	y1 = ysimprk + h * f(x, ysimprk);
	ysimprk = ysimprk + h * 0.5 * (f(x, ysimprk) + f(x + h, y1));
	# Runge-Kutta-Verfahren
	k1 = f(x, yrk);
	k2 = f(x + h/2, yrk + h/2 * k1);
	k3 = f(x + h/2, yrk + h/2 * k2);
	k4 = f(x + h, yrk + h * k3);
	yrk = yrk + h * (1/6) * (k1 + 2 * k2 + 2 * k3 + k4);
	printf(" %d & %.1f & %.8f & %.8f & %.8f %.8f & %.10f \\\\\n", i, x, y, yeuler, yimpeuler, ysimprk, yrk);
end
