all:	config ak yx

config:
	octave config.m

ak:	config config.dat ak.m
	octave ak.m

yx:	config.dat ak.dat yx.m
	octave yx.m

clean:
	rm -f *.dat *.png
