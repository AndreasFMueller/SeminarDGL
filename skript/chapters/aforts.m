#
# aforts.m -- analytische Fortsetzung der Funktion log(z)
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
function value = F(z, z0)
	s = 0;
	x = z - z0;
	a = x / z0;
	for k = 0:100
		s = s + a / (k+1);
		a = a * (-1) * x / z0;
	endfor
	value = s;
endfunction

F(sqrt(2)/2 * (1 + I), I) - F(sqrt(2)/2 * (1 + I), 1)
F(sqrt(2)/2 * (-1 + I), -1) - F(sqrt(2)/2 * (-1 + I), I)

F(sqrt(2)/2 * (1 - I), -I) - F(sqrt(2)/2 * (1 - I), 1)
F(sqrt(2)/2 * (-1 - I), -1) - F(sqrt(2)/2 * (-1 - I), -I)
