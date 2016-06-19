#
# szenarios.m -- verschiedene Szenarien für die Entwicklung des Universums
#
global	E;
E = 1;

function dadt = c_negativ_neg(a,t)
    global E;
    if a <= 0
	dadt = -1000000;
    else
	if 1/a > E
            dadt = -sqrt(1/a - E);
	else
            dadt = 0;
	end
    end
end

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
printf("t = %.3f, a = %.4f, dadt = %.4f\n", t, a, dadt);
end

function dadt = c_positiv(a,t)
    global E;
    if a <= 0
	dadt = 1000000;
    else
        dadt = sqrt(1/a + E);
    end
end

function dadt = c_zero(a,t)
    if a <= 0
	dadt = 1000000;
    else
        dadt = sqrt(1/a);
    end
end

t = 0.01 * (0:1000);


a0 = 1e-5;
apos = lsode(@c_positiv, a0, t);

azero = lsode(@c_zero, a0, t);
#azero = 3/2 * t.^(2/3);

t2 = 0.01 * (0:200);
anegup = lsode(@c_negativ_pos, a0, t2);
for i = (1:201)
	if anegup(i) == anegup(i+1)
	    k = i
	    break
	end
end
a0 = anegup(k)
aneg = zeros(2*k-1,1);
aneg(1:k,1) = anegup(1:k,1);
aneg(k+1:2*k-1,1) = flipud(anegup(1:k-1,1))

f = fopen("szenarios.mp", "w");
fprintf(f, "path apos, azero, aneg;\n");

# print path apos
fprintf(f, "apos := (0,0)\n");
for i = (1:1000)
	fprintf(f, "\n\t--(%.5f*u,%.5f*v)", t(i), apos(i));
end
fprintf(f, ";\n");

# print path azero
fprintf(f, "azero := (0,0)\n");
for i = (1:1000)
	fprintf(f, "\n\t--(%.5f*u,%.5f*v)", t(i), azero(i));
end
fprintf(f, ";\n");

# print path aneg
fprintf(f, "aneg := (0,0)\n");
for i = (1:2*k-1)
	fprintf(f, "\n\t--(%.5f*u,%.5f*v)", t(i), aneg(i));
end
fprintf(f, ";\n");

fclose(f);

