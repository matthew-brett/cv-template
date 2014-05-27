Creating your curriculum vitae
==============================

The content is stored as JSON and BibTeX in the `data` directory. To create a
PDF, run `make`.  Currently this will build a tex file based on the template
`_templates/cv.tex.tmpl` and then create a PDF from that by running `bibtex`
and `pdflatex`.
