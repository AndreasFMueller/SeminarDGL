#
# wiener.m -- simulation of wiender prozess
#
# (c) 2016 Prof Andreas MÃ¼ller, Hochschule Rapperswil
#
N = 2^10;
f = zeros(N + 1, 1);

sigma2 = 1;
f(N + 1) = normrnd(0, sqrt(sigma2));

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

scalefactor = max([abs(maximum), abs(minimum)])
maximum = maximum / scalefactor;
minimum = minimum / scalefactor;

fid = fopen("path.mp", "w");
fprintf(fid, "numeric minimum, maximum;\n");
fprintf(fid, "maximum := %.4f;\n", maximum);
fprintf(fid, "minimum := %.4f;\n", minimum);
fprintf(fid, "path p;\n");
fprintf(fid, "p := (0,%.4f)", f(1));
for i = (1:N)
	fprintf(fid, "\n--(%.4f,%.4f)\n", i/N, f(i+1)/scalefactor);
endfor
fprintf(fid, ";\n");
fclose(fid);
