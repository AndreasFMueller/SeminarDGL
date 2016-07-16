#
# integration for the graph
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#

function da = f(a,t)
    da = sqrt(1/a + 1e-1 + 1e-2*a^2);
end

a0 = 1e-10;
t0 = 0;

t = 0.01 * (0:2000);

a = lsode(@f, a0, t);

file = fopen("universe.mp", "w");
fprintf(file, "path p;\n");
fprintf(file, "p := (%.4f*u,%.4f*v)", t(1), a(1));
for i = (2:2001)
	fprintf(file, "\n--(%.4f*u, %.4f*v)", t(i), a(i));
endfor
fprintf(file, ";\n");
fclose(file);
