#
# Makefile -- build images for paper on friedmann equation
#
# (c) 2016 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
friedmann_FILES = friedmann-1.pdf

friedmann: $(friedmann_FILES)

$(friedmann_FILES):	friedmann.mp
	TEX=latex mpost friedmann.mp
	for f in friedmann.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

clean:
	rm -f friedmann-[0-9].pdf *.log *.mpx *.[0-9]
