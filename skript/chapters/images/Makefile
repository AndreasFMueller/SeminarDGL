#
# Makefile -- build images for the differential equations script
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	grundlagen numerik komplexezahlen

grundlagen_FILES = grundlagen-1.pdf
grundlagen:	$(grundlagen_FILES)
$(grundlagen_FILES):	grundlagen.mp
	TEX=latex mpost grundlagen.mp
	for f in grundlagen.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

numerik_FILES = numerik-1.pdf
numerik:	$(numerik_FILES)
$(numerik_FILES): numerik.mp
	TEX=latex mpost numerik.mp
	for f in numerik.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

komplexezahlen_FILES = komplexezahlen-1.pdf
komplexezahlen:	$(komplexezahlen_FILES)
$(komplexezahlen_FILES): komplexezahlen.mp
	TEX=latex mpost komplexezahlen.mp
	for f in komplexezahlen.[0-9]*; \
	do \
		mptopdf $${f}; \
	done


