#
# expeuler.m -- Euler-Verfahren für die Exponential-Funktion
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
y = 1;
y1 = 1;
y3 = 1;
x = 0;
h = 0.1;
alpha = 0.5;
i = 0;

printf(" %d & %.1f & %.8f & %.8f & %.8f \\\\\n", i, x, y, y1, y3);
while i < 10
	i = i + 1;
	x = i * h;
	y1 = y1 * (1 - alpha * h);
	y3 = y3 * (1 - alpha * h + 0.5 * alpha^2 * h^2 -1/6 * alpha^3 * h^3);
	y = exp(-alpha * x);
	printf(" %d & %.1f & %.8f & %.8f & %.8f \\\\\n", i, x, y, y1, y3);
end
