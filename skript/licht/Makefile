TIKZDIR = standalone
TIKZ_FILES = $(wildcard $(TIKZDIR)/*.tikz)
PDFTIKZ_FILES = $(patsubst %.tikz,%.pdf,$(TIKZ_FILES))


$(TIKZDIR)/%.pdf: $(TIKZDIR)/%.tikz
	cd $(TIKZDIR); \
	pdflatex $$(basename $<)

.PHONY : FORCE_MAKE
all : ${PDFTIKZ_FILES}

clean:
	cd $(TIKZDIR); \
	rm -f *.pdf *.aux *.log
