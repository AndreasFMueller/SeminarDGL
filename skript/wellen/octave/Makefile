WHICH := $(shell which which)
MAKE := $(shell $(WHICH) make)

A0 := 1
A1 := 0
A := 1
B := 0
C := -1
X0 := 0
XRANGE := '[-8, 8]'
XPLOT := '[-8, 8]'
XAUTOPLOT := true
YPLOT := '[-40, 40]'
YAUTOPLOT := true
SCALEFACTOR := 100
KMAX := 180
ARANGE := '[$(A), $(A)]' 1
BRANGE := '[$(B), $(B)]' 1
CRANGE := '[$(C), $(C)]' 1
A0RANGE := '[$(A0), $(A0)]' 1
A1RANGE := '[$(A1), $(A1)]' 1
KRANGE := '[$(KMAX), $(KMAX)]' 1
KRANGEPLOT := false
PARABOLAPLOT := false
WAVEPLOT := true
PLOTWAVE := true
PLOTKRANGE := false
PLOTPARABOLA := false
FILENAME := 'wave'

.PHONY:	all config ak a0a1 yx plot krange parabola clean

all:	config ak a0a1 yx plot

config:
	octave config.m -a0 $(A0) -a1 $(A1) -A $(A) -B $(B) -C $(C) \
	-x0 $(X0) -xrange $(XRANGE) -xplot $(XPLOT) -xautoplot $(XAUTOPLOT) \
	-yplot $(YPLOT) -yautoplot $(YAUTOPLOT) -scalefactor $(SCALEFACTOR) \
	-kmax $(KMAX) -arange $(ARANGE) -brange $(BRANGE) -crange $(CRANGE) \
	-a0range $(A0RANGE) -a1range $(A1RANGE) -krange $(KRANGE) \
	-krangeplot $(KRANGEPLOT) -parabolaplot $(PARABOLAPLOT) \
	-waveplot $(WAVEPLOT) -plotkrange $(PLOTKRANGE) -plotparabola $(PLOTPARABOLA) \
	-plotwave $(PLOTWAVE) -filename $(FILENAME)

ak:	config.dat ak.m
	octave ak.m

a0a1:	config.dat ak.dat a0a1.m
	octave a0a1.m

yx:	config.dat ak.dat yx.m
	octave yx.m

plot:	yx.dat config.dat yx.dat plotter.m
	octave plotter.m

krange:
	$(MAKE) XRANGE="'[-10, 10]'" XAUTOPLOT=true YAUTOPLOT=false KRANGE="'[30, 240]' 30" PLOTKRANGE=true

parabola:
	$(MAKE) ARANGE="'[1, 0]' -1/25" YAUTOPLOT=false YPLOT="'[-2, 40]'" PARABOLAPLOT=true PLOTPARABOLA=true PLOTWAVE=false

clean:
	rm -f *.dat *.png
