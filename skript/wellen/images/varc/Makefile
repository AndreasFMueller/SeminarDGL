all:	varc1.pdf varc2.pdf

varc1.pdf:	varc1.eps
	epstopdf varc1.eps

varc1.eps:	varc1.dat
	octave ../../octave/plotter.m -fontsize 24 -din varc1.dat -fout varc1.eps

varc1.dat:
	octave ../../octave/yx.m -polynom "1x^2+0x+-1" -ymin -5 -ymax 5 -calczerosn2 true -dout varc1.dat

varc2.pdf:	varc2.eps
	epstopdf varc2.eps

varc2.eps:	varc2.dat
	octave ../../octave/plotter.m -fontsize 24 -din varc2.dat -fout varc2.eps

varc2.dat:
	octave ../../octave/yx.m -polynom "1x^2+0x+-2" -ymin -5 -ymax 5 -calczerosn2 true -dout varc2.dat

clean:
	rm -f *.dat *.eps *.pdf

