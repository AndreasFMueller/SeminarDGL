WHICH := which
RM := $(shell $(WHICH) rm) -rf
MAKE := $(shell $(WHICH) make)
MKDIR := $(shell $(WHICH) mkdir) -p
EPSTOPDF := $(shell $(WHICH) epstopdf)
OCTAVE := $(shell $(WHICH) octave)
CD := cd
ECHO := @printf

IMAGEPATH := 
FILENAME :=
OPTIONS :=
PLOTOPTIONS :=

.PHONY: all plots plot dataonly plotonly kmax n4 clean

all:	createsubdirs
	$(MAKE) plots

plots:
	$(MAKE) plot IMAGEPATH='./images/allgemein' FILENAME='n1' OPTIONS='-polynom "-1x+0" -xmin -10 -xmax 10' PLOTOPTIONS='-din "./images/allgemein/n1.dat"'
	$(MAKE) plot IMAGEPATH='./images/basicfunctions' FILENAME='sin' OPTIONS='-polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 0 -a1 1' PLOTOPTIONS='-din "./images/basicfunctions/sin.dat"'
	$(MAKE) plot IMAGEPATH='./images/basicfunctions' FILENAME='sinh' OPTIONS='-polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 0 -a1 1' PLOTOPTIONS='-din "./images/basicfunctions/sinh.dat"'
	$(MAKE) plot IMAGEPATH='./images/basicfunctions' FILENAME='cos' OPTIONS='-polynom "1" -xmin -10 -xmax 10 -ymin -2 -ymax 2 -a0 1 -a1 0' PLOTOPTIONS='-din "./images/basicfunctions/cos.dat"'
	$(MAKE) plot IMAGEPATH='./images/basicfunctions' FILENAME='cosh' OPTIONS='-polynom "-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -a0 1 -a1 0' PLOTOPTIONS='-din "./images/basicfunctions/cosh.dat"'
	$(MAKE) plot IMAGEPATH='./images/vara' FILENAME='vara1' OPTIONS='-polynom "1/2^1x^2+0x+-1" -ymin -5 -ymax 5 -calczerosn2 true' PLOTOPTIONS='-din "./images/vara/vara1.dat"'
	$(MAKE) plot IMAGEPATH='./images/vara' FILENAME='vara2' OPTIONS='-polynom "1/2^2x^2+0x+-1" -ymin -5 -ymax 5 -calczerosn2 true' PLOTOPTIONS='-din "./images/vara/vara2.dat"'
	$(MAKE) plot IMAGEPATH='./images/varc' FILENAME='varc1' OPTIONS='-polynom "1x^2+0x+-1" -ymin -5 -ymax 5 -calczerosn2 true' PLOTOPTIONS='-din "./images/varc/varc1.dat"'
	$(MAKE) plot IMAGEPATH='./images/varc' FILENAME='varc2' OPTIONS='-polynom "1x^2+0x+-2" -ymin -5 -ymax 5 -calczerosn2 true' PLOTOPTIONS='-din "./images/varc/varc2.dat"'
	$(MAKE) kmax IMAGEPATH='./images/kmax' FILENAME='kmax' 
	$(MAKE) n4 IMAGEPATH='./images/allgemein'

$(IMAGEPATH)/$(FILENAME).dat:
	$(OCTAVE) ./octave/yx.m -dout "$(IMAGEPATH)/$(FILENAME).dat" $(OPTIONS)

$(IMAGEPATH)/$(FILENAME).eps:
	$(OCTAVE) ./octave/plotter.m -fout "$(IMAGEPATH)/$(FILENAME).eps" $(PLOTOPTIONS)

plot:	$(IMAGEPATH)/$(FILENAME).dat $(IMAGEPATH)/$(FILENAME).eps
	$(EPSTOPDF) $(IMAGEPATH)/$(FILENAME).eps

dataonly:	$(IMAGEPATH)/$(FILENAME).dat

plotonly:	$(IMAGEPATH)/$(FILENAME).eps
	$(EPSTOPDF) $(IMAGEPATH)/$(FILENAME).eps

kmax:
	number=30 ; \
	while [[ $$number -le 240 ]] ; do \
		$(MAKE) dataonly FILENAME="$(FILENAME)-$$number" OPTIONS="-polynom "1x^2+0x+-1" -xmin -10 -xmax 10 -ymin -40 -ymax 40 -kmax $$number"; \
		((number = number + 30)) ; \
	done
	$(MAKE) plotonly PLOTOPTIONS='-kmax "$(IMAGEPATH)"'

n4:
	$(MAKE) dataonly FILENAME='n2' OPTIONS='-polynom "-1/3x^2+0x+5" -kmax 300 -a0 -1 -a1 0'
	$(MAKE) plot FILENAME='n4' OPTIONS='-polynom "1/3.75^4x^4+0x^3+-1/3x^2+0x+5" -kmax 300 -a0 -1 -a1 0' PLOTOPTIONS='-n4 "$(IMAGEPATH)"'

createsubdirs:	
	$(MKDIR) ./images/allgemein ./images/basicfunctions ./images/kmax ./images/vara ./images/varc

clean:
	$(RM) ./images
