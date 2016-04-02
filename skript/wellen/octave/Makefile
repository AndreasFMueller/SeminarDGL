.PHONY:	all, config, ak, yx, plot, clean

all:	config ak yx plot

config:
	octave config.m

ak:	config.dat ak.m
	octave ak.m

yx:	config.dat ak.dat yx.m
	octave yx.m

plot:	yx.dat config.dat yx.dat
	octave waveplot.m

clean:
	rm -f *.dat *.png
