#
# wiener.m -- simulation of Wiener prozess
#
# (c) 2016 Prof Andreas Müller, Hochschule Rapperswil
#
global N = 2^10;
global f = zeros(N + 1, 1);

state = zeros(1, 625);
state(1) = 48;
rand("state", state);

sigma2 = 1;
f(N + 1) = normrnd(0, sqrt(sigma2));
sigma2 = 1/2;

delta = N;
while (delta >= 2)
	sigma2 = sigma2 / 2;
	i = 0;
	while (i < N-1)
		d = normrnd(0, sqrt(sigma2 / 2));
		f(i + 1 + delta/2) = d + (f(i + 1) + f(i + 1 + delta)) / 2;
		i = i + delta;
	end
	delta = delta/2;
end

maximum = max(f);
minimum = min(f);

global s = max([abs(maximum), abs(minimum)])
maximum = maximum / s;
minimum = minimum / s;

global fid = fopen("path3.mp", "w");
fprintf(fid, "numeric minimum, maximum;\n");
fprintf(fid, "maximum := %.4f;\n", maximum);
fprintf(fid, "minimum := %.4f;\n", minimum);

function drawpath(pathname, delta)
	global fid f N s
	i = 0;
	fprintf(fid, "path %s;\n", pathname);
	fprintf(fid, "%s := (0,%.4f)", pathname, f(i+1)/s);
	i = i + delta;
	while (i <= N)
		fprintf(fid, "\n--(%.4f,%.4f)", i/N, f(i+1)/s);
		i = i + delta;
	end
	fprintf(fid, ";\n");
endfunction

drawpath("pone", N);
drawpath("ptwo", N/2);
drawpath("pthree", N/4);
drawpath("pfour", N/8);
drawpath("pfive", N/16);
drawpath("psix", N/32);
drawpath("pseven", N/64);
drawpath("peight", N/128);
drawpath("pnine", N/256);
drawpath("pten", N/512);
drawpath("peleven", N/1024);

fclose(fid);
