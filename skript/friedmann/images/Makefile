#
# Makefile -- build images for paper on friedmann equation
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:

friedmann_FILES = friedmann-1.pdf friedmann-2.pdf friedmann-3.pdf \
	friedmann-4.pdf friedmann-5.pdf friedmann-6.pdf

images: $(friedmann_FILES)

$(friedmann_FILES):	friedmann.mp universe.mp szenarios.mp bigcrunch.mp
	TEX=latex mpost friedmann.mp
	for f in friedmann.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

clean:
	rm -f friedmann-[0-9].pdf *.log *.mpx *.[0-9]

szenarios.mp:	szenarios.m
	octave szenarios.m

universe.mp:	universe.m
	octave universe.m

bigcrunch.mp:	bigcrunch.m
	octave bigcrunch.m
