X0 := 0


.PHONY:	all, config, ak, a0a1, yx, plot, clean

all:	config ak a0a1 yx plot

config:
	octave config.m -x0 $(X0)

ak:	config.dat ak.m
	octave ak.m

a0a1:	config.dat ak.dat a0a1.m
	octave a0a1.m

yx:	config.dat ak.dat yx.m
	octave yx.m

plot:	yx.dat config.dat yx.dat
	octave waveplot.m

clean:
	rm -f *.dat *.png
