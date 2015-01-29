all: example1.html example2.html example1.md example3.html

R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

example1.html: example1.Rmd
	Rscript ${R_OPTS} -e 'library(knitr);knit2html("example1.Rmd", "example1.html")'

example2.html: example2.Rasciidoc
	Rscript ${R_OPTS} -e 'library(knitr);knit("example2.Rasciidoc")'
	asciidoc example2.txt

example3.html: example3.Rmd
	Rscript ${R_OPTS} -e 'library(rmarkdown);render("example3.Rmd")'

# knitr does Rmd -> md -> html
# you don't really need to create the intermediate md file,
# but it's interesting to look at at least once.
example1.md: example1.Rmd
	Rscript ${R_OPTS} -e 'library(knitr);knit("example1.Rmd")'
