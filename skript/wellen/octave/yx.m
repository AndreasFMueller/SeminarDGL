function eq = tokenize(polynom)
	printf('Polynom: %s\n', polynom);
	eq = {};
	i = 1;
	while (!isempty(polynom))
		[t, polynom] = strtok(polynom, "+*x");
		if (t(1) != '^')
			eq(i++) = t;
		endif
	endwhile
endfunction

tic();

help_message = { "Use the following parameters to configure the output:",
"\t-a0",
"\t\tSet the starting point y(0). (Default: 1)",
"\t-a1",
"\t\tSet the starting gradient y'(0). (Default: 0)",
"\t-polynom",
"\t\tThe polynom to calculate. Please remember that you need to add all coefficients even if they are 0 or 1. Also if the coefficient is negative use +-x. (Default: 1x^2+0x^1+-1)",
"\t\tExample: 1/4^2x^4+0x^3+-1.5x^2+0x+5.5",
"\t-xmin",
"\t\tSet the minimal x. (Default: -8)",
"\t-xmax",
"\t\tSet the maximal x. (Default: 8)",
"\t-ymin",
"\t\tSet the minimal y. (Default: -10)",
"\t-ymax",
"\t\tSet the maximal y. (Default: 10)",
"\t-dout",
"\t\tSelect the output path and filename for the generated data. (Default: ./yx.dat)",
"\t-h",
"\t\tShow this help message." };

filename = './yx.dat';

polynom = '1x^2+0x^1+-1';
a_0 = 1; # y(0)
a_1 = 0; # y'(0)

k_max = 180;

x_min = -8;
x_max = 8;
x_step = 1 / 100;

y_min = -10;
y_max = 10;

arglist = argv();

for i = (1:nargin)
	switch (arglist(i){1})
	case "-a0"
		a_0 = str2num(arglist(++i){1});
	case "-a1"
		a_1 = str2num(arglist(++i){1});
	case "-polynom"
		polynom = arglist(++i){1};
	case "-kmax"
		k_max = str2num(arglist(++i){1});
	case "-xmin"
		x_min = str2num(arglist(++i){1});
	case "-xmax"
		x_max = str2num(arglist(++i){1});
	case "-ymin"
		y_min = str2num(arglist(++i){1});
	case "-ymax"
		y_max = str2num(arglist(++i){1});
	case "-dout"
		filename = arglist(++i){1};
	case "-h"
		for i = (1:length(help_message))
			printf('%s\n', help_message{i});
		endfor
		exit();
	endswitch
endfor

printf('Setting output to: %s\n', filename);

tokenized_polynom = tokenize(polynom);

n = length(tokenized_polynom) - 1;

lambda_i = zeros(n + 1, 1);

for i = (n + 1:-1:1)
	lambda_i((n + 2) - i) = str2num(tokenized_polynom{i});
endfor

for i = (1:length(lambda_i))
	printf('lambda_%d: %d\n', i - 1, lambda_i(i));
endfor

datasize = round((x_max - x_min) / x_step);

y = zeros(datasize, 1);
p = zeros(datasize, 1);

a_k = zeros(n + 2 + k_max, 1);
a_k(n + 1) = a_0;
a_k(n + 2) = a_1;

for k = (2:k_max - n)
	s_pol = 0;
	for i = (0:n)
		s_pol += lambda_i(i + 1) * a_k(k - 2 - i + n + 1);
	endfor
	a_k(k + n + 1) = -1 / (k * (k - 1)) * s_pol;
endfor


for x = (x_min:x_step:x_max)
	array_pos = round((x - x_min) / x_step) + 1;

	p_pol = 0;
	for i = (0:n)
		p_pol += lambda_i(i + 1) * x ^ i;
	endfor
	p(array_pos) = p_pol;

	s_pot = a_0 + a_1 * x;
	for k = (2:k_max)
		s_pot += a_k(k + n + 1) * x ^ k;
	endfor
	y(array_pos) = s_pot;
endfor

x = linspace(x_min, x_max, datasize + 1);

save(filename, "x", "y", "p", "polynom", "x_min", "x_max", "y_min", "y_max");

toc();

