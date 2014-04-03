html: chunk_ref.html chunk_dep.html

%.html: %.Rmd
	R -e 'library(knitr);knit2html("$^")'

# A bit of fanciness there.
#
# % stands for anything, so we can have a general rule.
#
# $^ stands for the first dependency (%.Rmd in this case).
