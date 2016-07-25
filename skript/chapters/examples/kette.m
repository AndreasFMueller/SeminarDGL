#
# Loesung des Randwertproblems fuer die Kettenlinie
#
global x1 = -1
global x2 =  2
global y1 =  1
global y2 =  2

function v = f(m)
        global x1 x2 y1 y2
        v = cosh(x2 - x1 + asinh(m)) + y1 - y2 - sqrt(1 + m^2);
endfunction

function v = fprime(m)
        global x1 x2 y1 y2
        v = (sinh(x2 - x1 + asinh(m)) - m)/sqrt(1 + m^2);
endfunction

m = 0;

for i = (1:10)
        printf("%2d   %20.16f %20.16f\n", i, m, f(m));
        m = m - f(m)/fprime(m);
endfor
