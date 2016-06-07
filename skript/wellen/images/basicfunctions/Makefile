all:	sin.pdf cos.pdf sinh.pdf cosh.pdf

sin.pdf:	sin.eps
	epstopdf sin.eps

sin.eps:	sin.dat
	octave ../../octave/plotter.m -fontsize 24 -din sin.dat -fout sin.eps 

sin.dat:
	octave ../../octave/yx.m -polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 0 -a1 1 -dout sin.dat

cos.pdf:	cos.eps
	epstopdf cos.eps

cos.eps:	cos.dat
	octave ../../octave/plotter.m -fontsize 24 -din cos.dat -fout cos.eps 

cos.dat:
	octave ../../octave/yx.m -polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 1 -a1 0 -dout cos.dat

sinh.pdf:	sinh.eps
	epstopdf sinh.eps

sinh.eps:	sinh.dat
	octave ../../octave/plotter.m -fontsize 24 -din sinh.dat -fout sinh.eps 

sinh.dat:
	octave ../../octave/yx.m -polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 0 -a1 1 -dout sinh.dat

cosh.pdf:	cosh.eps
	epstopdf cosh.eps

cosh.eps:	cosh.dat
	octave ../../octave/plotter.m -fontsize 24 -din cosh.dat -fout cosh.eps 

cosh.dat:
	octave ../../octave/yx.m -polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 1 -a1 0 -dout cosh.dat

clean:
	rm -f *.eps *.dat *.pdf
