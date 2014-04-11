all: article.pdf example.pdf bibtex_example.pdf

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

article.pdf: article.tex
	pdflatex article.tex

example.tex: example.Rnw
	R ${R_OPTS} -e 'library(knitr);knit("example.Rnw")'

example.pdf: example.tex
	pdflatex example.tex
	pdflatex example.tex

bibtex_example.pdf: bibtex_example.tex bibtex_example.bib genetics.bst
	pdflatex bibtex_example
	bibtex bibtex_example
	pdflatex bibtex_example
	pdflatex bibtex_example
