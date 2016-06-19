OCTAVE = octave
YX = ../../octave/yx.m
PLOTTER = ../../octave/plotter.m

PLOTTER_OPTIONS = -fontsize 22

all:	sin.pdf cos.pdf sinh.pdf cosh.pdf

sin.pdf:	sin.eps
	epstopdf sin.eps

sin.eps:	sin.dat $(PLOTTER)
	$(OCTAVE) $(PLOTTER) $(PLOTTER_OPTIONS) -din sin.dat -fout sin.eps 

sin.dat:	Makefile $(YX)
	$(OCTAVE) $(YX) -polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 0 -a1 1 -dout sin.dat

cos.pdf:	cos.eps
	epstopdf cos.eps

cos.eps:	cos.dat $(PLOTTER)
	$(OCTAVE) $(PLOTTER) $(PLOTTER_OPTIONS) -din cos.dat -fout cos.eps 

cos.dat:	Makefile $(YX)
	$(OCTAVE) $(YX) -polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 1 -a1 0 -dout cos.dat

sinh.pdf:	sinh.eps
	epstopdf sinh.eps

sinh.eps:	sinh.dat $(PLOTTER)
	$(OCTAVE) $(PLOTTER) $(PLOTTER_OPTIONS) -din sinh.dat -fout sinh.eps 

sinh.dat:	Makefile $(YX)
	$(OCTAVE) $(YX) -polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 0 -a1 1 -dout sinh.dat

cosh.pdf:	cosh.eps
	epstopdf cosh.eps

cosh.eps:	cosh.dat $(PLOTTER)
	$(OCTAVE) $(PLOTTER) $(PLOTTER_OPTIONS) -din cosh.dat -fout cosh.eps 

cosh.dat:	Makefile $(YX)
	$(OCTAVE) $(YX) -polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 1 -a1 0 -dout cosh.dat

clean:
	rm -f *.eps *.dat *.pdf
