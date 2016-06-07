OCTAVE_YX := octave ../../octave/yx.m
OCTAVE_PLOTTER := octave ../../octave/plotter.m

YX_OPTIONS := -polynom "1x^2+0x+-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40

all:	kmax.pdf

kmax.pdf:	kmax.eps
	epstopdf kmax.eps

kmax.eps:	kmax-30.dat kmax-60.dat kmax-90.dat kmax-120.dat kmax-150.dat \
		kmax-180.dat kmax-210.dat kmax-240.dat
	$(OCTAVE_PLOTTER) -kmax ./ -fout kmax.eps

kmax-30.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 30 -dout kmax-30.dat

kmax-60.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 60 -dout kmax-60.dat

kmax-90.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 90 -dout kmax-90.dat

kmax-120.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 120 -dout kmax-120.dat

kmax-150.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 150 -dout kmax-150.dat

kmax-180.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 180 -dout kmax-180.dat

kmax-210.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 210 -dout kmax-210.dat

kmax-240.dat:
	$(OCTAVE_YX) $(YX_OPTIONS) -kmax 240 -dout kmax-240.dat

clean:
	rm -f *.dat *.eps *.pdf

