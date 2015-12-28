#
# Makefile -- build images for the differential equations script
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
numerik_FILES = numerik-1.pdf
$(numerik_FILES): numerik.mp
	TEX=latex mpost numerik.mp
	for f in numerik.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

