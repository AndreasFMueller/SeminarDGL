#
# bigcrunch.m -- verschiedene Bigchrunch-Historien
#
global	E;
E = 1;

function dadt = c_negativ_pos(a,t)
    global E;
    if a <= 0
	dadt = 0;
    else
	if 1/a > E
	    dadt = sqrt(1/a - E);
	else
	    dadt = 0;
	end
    end
end

t = 0.01 * (0:1000);


a0 = 1e-5;
t2 = 0.01 * (0:400);

E = 1
a = lsode(@c_negativ_pos, a0, t2);
for i = (1:401)
	if a(i) == a(i+1)
	    k = i
	    break
	end
end
aone = zeros(2*k-1,1);
aone(1:k,1) = a(1:k,1);
aone(k+1:2*k-1,1) = flipud(a(1:k-1,1));

E = 2
a = lsode(@c_negativ_pos, a0, t2);
for i = (1:801)
	if a(i) == a(i+1)
	    k = i
	    break
	end
end
k
atwo = zeros(2*k-1,1);
atwo(1:k,1) = a(1:k,1);
atwo(k+1:2*k-1,1) = flipud(a(1:k-1,1));

E = 0.5
t2 = 0.01 * (0:800);
a = lsode(@c_negativ_pos, a0, t2);
for i = (1:801)
	if a(i) == a(i+1)
	    k = i
	    break
	end
end
ahalf = zeros(2*k-1,1);
ahalf(1:k,1) = a(1:k,1);
ahalf(k+1:2*k-1,1) = flipud(a(1:k-1,1));
ahalf

f = fopen("bigcrunch.mp", "w");
fprintf(f, "path aone, atwo, ahalf;\n");

# print path apos
fprintf(f, "aone := (0,0)");
for i = (1:size(aone)(1))
	fprintf(f, "\n\t--(%.5f*u,%.5f*v)", t(i), aone(i));
end
fprintf(f, ";\n");

# print path atwo
fprintf(f, "atwo := (0,0)");
for i = (1:size(atwo)(1))
	fprintf(f, "\n\t--(%.5f*u,%.5f*v)", t(i), atwo(i));
end
fprintf(f, ";\n");

# print path aneg
fprintf(f, "ahalf := (0,0)");
for i = (1:size(ahalf)(1))
	fprintf(f, "\n\t--(%.5f*u,%.5f*v)", t(i), ahalf(i));
end
fprintf(f, ";\n");

fclose(f);

