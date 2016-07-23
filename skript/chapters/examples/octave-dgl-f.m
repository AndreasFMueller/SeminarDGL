global omega = 0.1;

function yprime = f(y, x)
        global omega;
        yprime = [ y(2); -y(1) + sin(omega * x) ];
endfunction
