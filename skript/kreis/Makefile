all:

images:	besselfunktion.pdf

besselfunction.pdf: besselfunction.tex besselfunction_koeffizienten.m besselfunction-inc.pdf
	pdflatex besselfunction.tex

besselfunction.tex: besselfunction_koeffizienten.m
	octave besselfunction_koeffizienten.m

clean:
	rm besselfunction.* besselfunction-inc.pdf
