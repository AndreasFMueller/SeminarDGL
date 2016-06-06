all:	$(patsubst %.tikz,%.pdf,$(wildcard *.tikz))

%.pdf:	%.tikz
	pdflatex $$(basename $<)

clean:
	rm -f *.pdf *.aux *.log
