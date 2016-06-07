OCTAVE_YX := octave ../../octave/yx.m
OCTAVE_PLOTTER := octave ../../octave/plotter.m

all:	sin.pdf cos.pdf sinh.pdf cosh.pdf

sin.pdf:	sin.eps
	epstopdf sin.eps

sin.eps:	sin.dat
	$(OCTAVE_PLOTTER) -fontsize 24 -din sin.dat -fout sin.eps 

sin.dat:
	$(OCTAVE_YX) -polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 0 -a1 1 -dout sin.dat

cos.pdf:	cos.eps
	epstopdf cos.eps

cos.eps:	cos.dat
	$(OCTAVE_PLOTTER) -fontsize 24 -din cos.dat -fout cos.eps 

cos.dat:
	$(OCTAVE_YX) -polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 1 -a1 0 -dout cos.dat

sinh.pdf:	sinh.eps
	epstopdf sinh.eps

sinh.eps:	sinh.dat
	$(OCTAVE_PLOTTER) -fontsize 24 -din sinh.dat -fout sinh.eps 

sinh.dat:
	$(OCTAVE_YX) -polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 0 -a1 1 -dout sinh.dat

cosh.pdf:	cosh.eps
	epstopdf cosh.eps

cosh.eps:	cosh.dat
	$(OCTAVE_PLOTTER) -fontsize 24 -din cosh.dat -fout cosh.eps 

cosh.dat:
	$(OCTAVE_YX) -polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 1 -a1 0 -dout cosh.dat

clean:
	rm -f *.eps *.dat *.pdf
