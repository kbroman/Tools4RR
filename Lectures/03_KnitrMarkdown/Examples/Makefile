all: example1.html example2.html

example1.html: example1.Rmd
	Rscript -e 'library(knitr);knit2html("example1.Rmd", "example1.html")'

example2.html: example2.asciidoc
	Rscript -e 'library(knitr);knit("example2.asciidoc")'
	asciidoc -a data-uri -a toc -a toclevels=4 -a num example2.txt
