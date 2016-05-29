WHICH := which
CAT := $(shell $(WHICH) cat)
RM := $(shell $(WHICH) rm) -rf
FIND := $(shell $(WHICH) find)
GREP := $(shell $(WHICH) egrep)
MAKE := $(shell $(WHICH) make)
MKDIR := $(shell $(WHICH) mkdir) -p
MOVE := $(shell $(WHICH) mv)
EPSTOPDF := $(shell $(WHICH) epstopdf)
OCTAVE := $(shell $(WHICH) octave)
CD := cd
ECHO := @printf

IMAGEPATH := 

EPSEXTENSION := '.eps$$'

EPSFILES := $(FIND) . | $(GREP) $(EPSEXTENSION)

.PHONY: all n1 n4 sin sinh cos cosh kmax vara1 vara2 varc1 varc2 createsubdirs clean

all:	createsubdirs subdirs
	@$(foreach file, $(shell $(EPSFILES)), $(EPSTOPDF) $(file);)

subdirs:
	$(MAKE) n1 IMAGEPATH='./images/allgemein/n1'
	$(MAKE) n4 IMAGEPATH='./images/allgemein/n4'
	$(MAKE) sin IMAGEPATH='./images/basicfunctions/sin'
	$(MAKE) sinh IMAGEPATH='./images/basicfunctions/sinh'
	$(MAKE) cos IMAGEPATH='./images/basicfunctions/cos'
	$(MAKE) cosh IMAGEPATH='./images/basicfunctions/cosh'
	$(MAKE) kmax IMAGEPATH='./images/kmax/kmax'
	$(MAKE) vara1 IMAGEPATH='./images/vara/vara1'
	$(MAKE) vara2 IMAGEPATH='./images/vara/vara2'
	$(MAKE) varc1 IMAGEPATH='./images/varc/varc1'
	$(MAKE) varc2 IMAGEPATH='./images/varc/varc2'

n1:
	$(OCTAVE) ./octave/yx.m -polynom "-1x+0" -dout "$(IMAGEPATH).dat" -xmin -10 -xmax 10
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

n4:
	$(OCTAVE) ./octave/yx.m -polynom "1/4^2x^4+0x^3+-1.5x^2+0x+5.5" -dout "$(IMAGEPATH).dat" \
		-xmin -6 -xmax 6 -ymin -15 -ymax 15 -a0 -2 -a1 0 -kmax 300
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

sin:	
	$(OCTAVE) ./octave/yx.m -polynom "1" -dout "$(IMAGEPATH).dat" -xmin -10 -xmax 10 \
		-ymin -2 -ymax 2 -a0 0 -a1 1
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

sinh:
	$(OCTAVE) ./octave/yx.m -polynom "-1" -dout "$(IMAGEPATH).dat" -xmin -10 -xmax 10 \
		-ymin -40 -ymax 40 -a0 0 -a1 1
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

cos:
	$(OCTAVE) ./octave/yx.m -polynom "1" -dout "$(IMAGEPATH).dat" -xmin -10 -xmax 10 \
		-ymin -2 -ymax 2 -a0 1 -a1 0
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

cosh:
	$(OCTAVE) ./octave/yx.m -polynom "-1" -dout "$(IMAGEPATH).dat" -xmin -10 -xmax 10 \
		-ymin -40 -ymax 40 -a0 1 -a1 0
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

kmax:
	number=30 ; \
	while [[ $$number -le 240 ]] ; do \
		$(OCTAVE) ./octave/yx.m -polynom "1x^2+0x+-1" -dout "$(IMAGEPATH)-$$number.dat" \
		-xmin -10 -xmax 10 -ymin -40 -ymax 40 -kmax $$number; \
		((number = number + 30)) ; \
	done
	$(OCTAVE) ./octave/plotter.m -fout "$(IMAGEPATH).eps" -kmax "./images/kmax"

vara1:
	$(OCTAVE) ./octave/yx.m -polynom "1/2x^2+0x+-1" -dout "$(IMAGEPATH).dat" -ymin -5 -ymax 5
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

vara2:
	$(OCTAVE) ./octave/yx.m -polynom "1/2^2+0x+-0" -dout "$(IMAGEPATH).dat" -ymin -5 -ymax 5
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

varc1:
	$(OCTAVE) ./octave/yx.m -polynom "1x^2+0x+-1" -dout "$(IMAGEPATH).dat" -ymin -5 -ymax 5
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

varc2:
	$(OCTAVE) ./octave/yx.m -polynom "1x^2+0x+-2" -dout "$(IMAGEPATH).dat" -ymin -5 -ymax 5
	$(OCTAVE) ./octave/plotter.m -din "$(IMAGEPATH).dat" -fout "$(IMAGEPATH).eps"

createsubdirs:	
	$(MKDIR) ./images/allgemein ./images/basicfunctions ./images/kmax ./images/vara ./images/varc

clean:
	$(RM) ./images
