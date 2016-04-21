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
PARABOLAPLOT := true
WAVEPLOT := true
PARABOLAZEROSPLOT := true
PLOTWAVE := true
PLOTKRANGE := false
PLOTPARABOLA := false
PLOTBPARABOLA := false
FILENAME := 'wave'
KRANGEFRAMES := false

.PHONY:	all config ak a0a1 yx plot krange aparabola anegparabola bparabola clean

all:	config ak a0a1 yx plot

config:
	octave config.m -a0 $(A0) -a1 $(A1) -A $(A) -B $(B) -C $(C) \
	-x0 $(X0) -xrange $(XRANGE) -xplot $(XPLOT) -xautoplot $(XAUTOPLOT) \
	-yplot $(YPLOT) -yautoplot $(YAUTOPLOT) -scalefactor $(SCALEFACTOR) \
	-kmax $(KMAX) -arange $(ARANGE) -brange $(BRANGE) -crange $(CRANGE) \
	-a0range $(A0RANGE) -a1range $(A1RANGE) -krange $(KRANGE) \
	-krangeplot $(KRANGEPLOT) -parabolaplot $(PARABOLAPLOT) \
	-waveplot $(WAVEPLOT) -plotkrange $(PLOTKRANGE) -plotparabola $(PLOTPARABOLA) \
	-plotwave $(PLOTWAVE) -filename $(FILENAME) -parabolazerosplot $(PARABOLAZEROSPLOT) \
	-plotbparabola $(PLOTBPARABOLA) -krangeframes $(KRANGEFRAMES)

ak:	config.dat ak.m
	octave ak.m

a0a1:	config.dat ak.dat a0a1.m
	octave a0a1.m

yx:	config.dat ak.dat yx.m
	octave yx.m

plot:	yx.dat config.dat yx.dat plotter.m
	octave plotter.m

krange:
	$(MAKE) XRANGE="'[-10, 10]'" XAUTOPLOT=true YAUTOPLOT=false KRANGE="'[2, 242]' 5" PLOTKRANGE=true PLOTWAVE=false

aparabola:
	$(MAKE) XRANGE="'[-8, 8]'" XAUTOPLOT=false ARANGE="'[1, 0]' -1/32" C=-1 YAUTOPLOT=false YPLOT="'[-25, 25]'" PARABOLAPLOT=true PLOTPARABOLA=true PLOTWAVE=false

anegparabola:
	$(MAKE) XRANGE="'[-8, 8]'" XAUTOPLOT=false ARANGE="'[-1, 0]' 1/32" C=1 YAUTOPLOT=false YPLOT="'[-25, 25]'" PARABOLAPLOT=true PLOTPARABOLA=true PLOTWAVE=false

bparabola:
	$(MAKE) XRANGE="'[-10, 10]'" XAUTOPLOT=true BRANGE="'[-8, 8]' 1" YAUTOPLOT=false YPLOT="'[-20, 20]'" PLOTBPARABOLA=true PLOTWAVE=false

clean:
	rm -f *.dat *.png
