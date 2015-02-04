LECNUM = 03
LEC = ${LECNUM}_knitr_Rmd

include ../MakeSrc_lectures.mk

03_hw_solutions.html: 03_hw_solutions.Rmd
	R $(R_OPTS) -e "rmarkdown::render('$<')"
