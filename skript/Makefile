#
# Makefile zum Skript ueber Differentialgleichungen
#
# (c) 2015 Prof Dr Andreas Mueller, Hochschule Rapperswil
#
all:	subdirs skript.pdf

SUBDIRECTORIES = chapters uebungsaufgaben wellen kreis licht \
		 komplex friedmann

subdirs:
	for d in $(SUBDIRECTORIES); \
	do \
		cd $${d}; make; cd ..; \
	done

CHAPTERS = chapters/einleitung.tex \
	chapters/grundlagen.tex \
	chapters/potenzreihen.tex \
	chapters/linear.tex \
	chapters/geometrie.tex \
	chapters/komplex.tex \
	chapters/numerik.tex \
	chapters/stabilitaet.tex \
	chapters/chaos.tex

SKRIPTFILES = vorwort.tex uebersicht.tex \
	$(CHAPTERS) \
	references.bib

THEMA_FILES = thema/main.tex

TEXFILES = $(SKRIPTFILES) \
	$(THEMA_FILES)

IMAGES =

BLXFILES = skript1-blx.bbl \
	skript2-blx.bbl skript3-blx.bbl skript4-blx.bbl \
	skript5-blx.bbl skript6-blx.bbl skript7-blx.bbl skript8-blx.bbl
#	skript9-blx.bbl skript10-blx.bbl skript11-blx.bbl skript12-blx.bbl \
#	skript13-blx.bbl skript14-blx.bbl skript15-blx.bbl skript16-blx.bbl \
#	skript17-blx.bbl

skript.pdf:	skript.tex $(TEXFILES) skript.ind $(IMAGES) \
			$(BLXFILES)
	pdflatex -shell-escape skript.tex
	bibtex skript

skript.ind:	skript.tex $(TEXFILES)
	touch skript.ind
	cd chapters && make
	pdflatex -shell-escape skript.tex
	makeindex skript.idx

# References

skript.bbl:		skript.aux
	bibtex skript

skript1-blx.bbl:	skript1-blx.aux
	bibtex skript1-blx

skript2-blx.bbl:	skript2-blx.aux
	bibtex skript2-blx

skript3-blx.bbl:	skript3-blx.aux
	bibtex skript3-blx

skript4-blx.bbl:	skript4-blx.aux
	bibtex skript4-blx

skript5-blx.bbl:	skript5-blx.aux
	bibtex skript5-blx

skript6-blx.bbl:	skript6-blx.aux
	bibtex skript6-blx

skript7-blx.bbl:	skript7-blx.aux
	bibtex skript7-blx

skript8-blx.bbl:	skript8-blx.aux
	bibtex skript8-blx
#
#skript9-blx.bbl:	skript9-blx.aux
#	bibtex skript9-blx
#
#skript10-blx.bbl:	skript10-blx.aux
#	bibtex skript10-blx
#
#skript11-blx.bbl:	skript11-blx.aux
#	bibtex skript11-blx
#
#skript12-blx.bbl:	skript12-blx.aux
#	bibtex skript12-blx
#
#skript13-blx.bbl:	skript13-blx.aux
#	bibtex skript13-blx
#
#skript14-blx.bbl:	skript14-blx.aux
#	bibtex skript14-blx
#
#skript15-blx.bbl:	skript15-blx.aux
#	bibtex skript15-blx
#
#skript16-blx.bbl:	skript16-blx.aux
#	bibtex skript16-blx
#
#skript17-blx.bbl:	skript17-blx.aux
#	bibtex skript17-blx

clean:	cleansubdir
	rm -f *.bbl *.aux *.log *.out *.run.xml *.pdf *.blg *.idx *.ind \
		*.ilg *.toc *.synctex.gz *.auxlock *.bak *-blx.bib *.dvi

cleansubdir:
	for d in $(SUBDIRECTORIES); \
	do \
		cd $${d}; make clean; cd ..; \
	done
