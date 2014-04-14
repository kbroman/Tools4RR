all: example.pdf

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

example.pdf: example.tex
	pdflatex example.tex

example.tex: example.Rnw
	R ${R_OPTS} -e 'library(knitr);knit("example.Rnw")'
