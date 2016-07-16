#
# Makefile -- SK Operator bauen
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
.PHONY:	all images clean

all:

images:	operator-1.pdf

operator-1.pdf:	operator.mp
	TEX=latex mpost operator.mp
	mptopdf operator.1

clean:
	rm -f operator-1.pdf operator.1 *.log *.mpx
