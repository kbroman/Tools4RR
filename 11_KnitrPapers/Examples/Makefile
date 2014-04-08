all: article.pdf example.pdf

article.pdf: article.tex
	pdflatex article.tex

example.tex: example.Rnw
	R -e 'library(knitr);knit("example.Rnw")'

example.pdf: example.tex
	pdflatex example.tex
