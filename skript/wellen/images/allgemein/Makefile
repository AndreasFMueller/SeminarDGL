OCTAVE_YX := octave ../../octave/yx.m
OCTAVE_PLOTTER := octave ../../octave/plotter.m

all:	n1.pdf n4.pdf

n1.pdf:	n1.eps
	epstopdf n1.eps

n1.eps:	n1.dat
	$(OCTAVE_PLOTTER) -din n1.dat -fout n1.eps 

n1.dat:	Makefile
	$(OCTAVE_YX) -polynom "-1x+0" -xmin -10 -xmax 10 -dout n1.dat

n4.pdf:	n4.eps
	epstopdf n4.eps

n4.eps:	n2.dat n4.dat
	$(OCTAVE_PLOTTER) -n4 ./ -fout n4.eps

n2.dat:	Makefile
	$(OCTAVE_YX) -polynom "-1/3x^2+0x+5" -kmax 300 -a0 -1 -a1 0 -dout n2.dat

n4.dat: Makefile
	$(OCTAVE_YX) -polynom "1/3.75^4x^4+0x^3+-1/3x^2+0x+5" -kmax 300 -a0 -1 -a1 0 -dout n4.dat

clean:
	rm -f *.eps *.dat *.pdf
