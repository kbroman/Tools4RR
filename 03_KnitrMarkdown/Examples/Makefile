all: example1.html example2.html

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

example1.html: example1.Rmd
	R ${R_OPTS} -e "rmarkdown::render('example1.Rmd')"

example2.html: example2.Rasciidoc
	Rscript ${R_OPTS} -e "library(knitr);knit('example2.Rasciidoc')"
	asciidoc example2.txt
