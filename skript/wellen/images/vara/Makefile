OCTAVE_YX := octave ../../octave/yx.m
OCTAVE_PLOTTER := octave ../../octave/plotter.m

all:	vara1.pdf vara2.pdf

vara1.pdf:	vara1.eps
	epstopdf vara1.eps

vara1.eps:	vara1.dat
	$(OCTAVE_PLOTTER) -fontsize 24 -din vara1.dat -fout vara1.eps

vara1.dat:	Makefile
	$(OCTAVE_YX) -polynom "1/2^1x^2+0x+-1" -ymin -5 -ymax 5 -calczerosn2 true -dout vara1.dat

vara2.pdf:	vara2.eps
	epstopdf vara2.eps

vara2.eps:	vara2.dat
	$(OCTAVE_PLOTTER) -fontsize 24 -din vara2.dat -fout vara2.eps

vara2.dat:	Makefile
	$(OCTAVE_YX) -polynom "1/2^2x^2+0x+-1" -ymin -5 -ymax 5 -calczerosn2 true -dout vara2.dat

clean:
	rm -f *.dat *.eps *.pdf

