SUBDIRS := allgemein basicfunctions kmax vara varc

all:
	for d in $(SUBDIRS); \
	do \
		cd $${d}; make; cd ..; \
	done

clean:
	for d in $(SUBDIRS); \
	do \
		cd $${d}; make clean; cd ..; \
	done
