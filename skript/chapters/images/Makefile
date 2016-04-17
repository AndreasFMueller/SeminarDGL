#
# Makefile -- build images for the differential equations script
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	grundlagen numerik komplexezahlen randwert geometrie airy \
	stochastisch komplex bifurkation

grundlagen_FILES = grundlagen-1.pdf
grundlagen:	$(grundlagen_FILES)
$(grundlagen_FILES):	grundlagen.mp
	TEX=latex mpost grundlagen.mp
	for f in grundlagen.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

numerik_FILES = numerik-1.pdf numerik-2.pdf numerik-3.pdf
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

randwert_FILES = randwert-1.pdf randwert-2.pdf randwert-3.pdf
randwert:	$(randwert_FILES)
$(randwert_FILES): randwert.mp
	TEX=latex mpost randwert.mp
	for f in randwert.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

harvest.mp:	harvest
	./harvest

harvest:	harvest.c
	gcc -o harvest -Wall -O2 -std=c99 -g harvest.c -lgsl

cube.mp:	cube
	./cube

cube:	cube.c
	gcc -o cube -Wall -O2 -std=c99 -g cube.c -lgsl

geometrie_FILES = geometrie-1.pdf geometrie-2.pdf geometrie-3.pdf	\
	geometrie-4.pdf geometrie-5.pdf geometrie-6.pdf geometrie-7.pdf	\
	geometrie-8.pdf geometrie-9.pdf geometrie-10.pdf geometrie-11.pdf
geometrie:	$(geometrie_FILES)
$(geometrie_FILES): geometrie.mp harvest.mp cube.mp
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

stochastisch_FILES = stochastisch-1.pdf stochastisch-2.pdf stochastisch-3.pdf \
	stochastisch-4.pdf stochastisch-5.pdf stochastisch-6.pdf \
	stochastisch-7.pdf stochastisch-8.pdf stochastisch-9.pdf \
	stochastisch-10.pdf stochastisch-11.pdf stochastisch-12.pdf \
	stochastisch-13.pdf

stochastisch:	$(stochastisch_FILES)
$(stochastisch_FILES): stochastisch.mp path.mp path2.mp path3.mp
	TEX=latex mpost stochastisch.mp
	for f in stochastisch.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

path.mp:	wiener.m
	octave wiener.m

path2.mp:	wiener2.m
	octave wiener2.m

path3.mp:	wiener3.m
	octave wiener3.m


komplex_FILES = komplex-1.pdf komplex-2.pdf komplex-3.pdf
komplex:	$(komplex_FILES)
$(komplex_FILES): komplex.mp
	TEX=latex mpost komplex.mp
	for f in komplex.[0-9]*; \
	do \
		mptopdf $${f}; \
	done

bifurkation_FILES = bifurkation-1.pdf  bifurkation-2.pdf
bifurkation:	$(bifurkation_FILES)
$(bifurkation_FILES): bifurkation.mp
	TEX=latex mpost bifurkation.mp
	for f in bifurkation.[0-9]*; \
	do \
		mptopdf $${f}; \
	done







