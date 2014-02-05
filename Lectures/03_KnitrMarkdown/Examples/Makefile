all: example1.html example2.html example1.md

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

example1.html: example1.Rmd
	R ${R_OPTS} -e 'library(knitr);knit2html("example1.Rmd", "example1.html")'

example2.html: example2.asciidoc
	R ${R_OPTS} -e 'library(knitr);knit("example2.asciidoc")'
	asciidoc -a data-uri -a toc -a toclevels=4 -a num example2.txt

# knitr does Rmd -> md -> html
# you don't really need to create the intermediate md file, 
# but it's interesting to look at at least once.
example1.md: example1.Rmd
	R ${R_OPTS} -e 'library(knitr);knit("example1.Rmd")'
