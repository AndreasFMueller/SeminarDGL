#
# Makefile für Bilder zum Artikel über Wellen
#
.PHONY:	all iamges clean

SUBDIRS = allgemein basicfunctions kmax vara varc

all:

images:
	for d in $(SUBDIRS); \
	do \
		cd $${d}; make; cd ..; \
	done

clean:
	for d in $(SUBDIRS); \
	do \
		cd $${d}; make clean; cd ..; \
	done
