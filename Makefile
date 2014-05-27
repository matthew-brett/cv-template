BUILDDIR = _build
TEXDIR = _build/tex
HTMLDIR = _build/html
PDFDIR = _build/pdfs
TEMPLATES = _templates
STATIC = _static

BUILDTMPL = ./build_template.py
TEX2PDF := cd $(TEXDIR) && TEXINPUTS="../../_static:" pdflatex #-interaction=batchmode

all: clean cv.pdf

clean:
	rm -rf  $(BUILDDIR)/* *.pyc cv.pdf

$(TEXDIR):
	mkdir -p $@

$(TEXDIR)/%.tex: $(TEXDIR)
	$(BUILDTMPL) $(@F)

$(TEXDIR)/%.pdf: $(TEXDIR)/%.tex
	$(TEX2PDF) $(<F) 
	bibtex $(TEXDIR)/abstracts.aux
	bibtex $(TEXDIR)/proceedings.aux
	bibtex $(TEXDIR)/editorial.aux 
	bibtex $(TEXDIR)/journal.aux 
	bibtex $(TEXDIR)/reports.aux
	$(TEX2PDF) $(<F) 
	$(TEX2PDF) $(<F)

cv.pdf: $(TEXDIR)/cv.pdf
	mv $(TEXDIR)/cv.pdf cv.pdf
