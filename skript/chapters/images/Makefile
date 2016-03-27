#
# Makefile -- build images for the differential equations script
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	grundlagen numerik komplexezahlen randwert geometrie airy

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

randwert_FILES = randwert-1.pdf
randwert:	$(randwert_FILES)
$(randwert_FILES): randwert.mp
	TEX=latex mpost randwert.mp
	for f in randwert.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

geometrie_FILES = geometrie-1.pdf geometrie-2.pdf geometrie-3.pdf	\
	geometrie-4.pdf geometrie-5.pdf geometrie-6.pdf geometrie-7.pdf	\
	geometrie-8.pdf
geometrie:	$(geometrie_FILES)
$(geometrie_FILES): geometrie.mp
	TEX=latex mpost geometrie.mp
	for f in geometrie.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

airy_FILES = airy-1.pdf 
airy:	$(airy_FILES)
$(airy_FILES): airy.mp
	TEX=latex mpost airy.mp
	for f in airy.[0-9]*; \
	do \
		mptopdf $${f}; \
	done



