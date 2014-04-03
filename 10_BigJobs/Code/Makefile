html: chunk_ref.html chunk_dep.html

%.html: %.Rmd
	R -e 'library(knitr);knit2html("$^")'
