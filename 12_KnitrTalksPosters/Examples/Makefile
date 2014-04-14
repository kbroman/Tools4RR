all: beamer_example.pdf slidify_example/index.html

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

beamer_example.pdf: beamer_example.tex
	pdflatex beamer_example.tex

beamer_example.tex: beamer_example.Rnw
	R ${R_OPTS} -e 'library(knitr);knit("beamer_example.Rnw")'

slidify_example/index.html: slidify_example/index.Rmd
	cd slidify_example;R ${R_OPTS} -e 'library(slidify);slidify("index.Rmd")'
