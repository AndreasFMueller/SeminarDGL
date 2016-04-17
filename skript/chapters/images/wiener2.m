#
# wiener2.m -- simulation of wiener prozess
#
# (c) 2016 Prof Andreas Müller, Hochschule Rapperswil
#
N = 2^13;
n = 2;
f = zeros(N + 1, n);
sigma2 = 1;

rand("state", 48);

f(N + 1,1) = normrnd(0, sqrt(sigma2));
f(N + 1,2) = normrnd(0, sqrt(sigma2));

delta = N;
while (delta >= 2)
	sigma2 = sigma2 / 2;
	i = 0;
	while (i < N-1)
		for j = 1:n
			d = normrnd(0, sqrt(sigma2 / 2));
			f(i + 1 + delta/2, j) = d + (f(i + 1, j) + f(i + 1 + delta, j)) / 2;
		endfor
		i = i + delta;
	end
	delta = delta/2;
end

maximum = max(f);
minimum = min(f);

span = maximum - minimum;
if (span(1) < span(2))
	a = f(:, 1);
	f(:, 1) = f(:, 2);
	f(:, 2) = a;
endif

maximum = max(f);
minimum = min(f);

s = max([abs(max(maximum)), abs(min(minimum))])
maximum = maximum / s;
minimum = minimum / s;

fid = fopen("path2.mp", "w");
fprintf(fid, "numeric xminimum, xmaximum;\n");
fprintf(fid, "xmaximum := %.4f;\n", maximum(1));
fprintf(fid, "xminimum := %.4f;\n", minimum(1));
fprintf(fid, "numeric yminimum, ymaximum;\n");
fprintf(fid, "ymaximum := %.4f;\n", maximum(2));
fprintf(fid, "yminimum := %.4f;\n", minimum(2));
fprintf(fid, "path p;\n");
fprintf(fid, "p := (%.4f,%.4f)\n", f(1,1)/s, f(1,2)/s);
for i = (1:N-1)
	fprintf(fid, "--(%.4f,%.4f)\n", f(i+1,1)/s, f(i+1,2)/s);
endfor
fprintf(fid, "--(%.4f,%.4f);\n", f(N+1,1)/s, f(N+1,2)/s);
fclose(fid);
