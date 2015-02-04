LECNUM = 03
LEC = ${LECNUM}_knitr_Rmd

hwsoln: 03_hw_solutions.html

include ../MakeSrc_lectures.mk

03_hw_solutions.html: 03_hw_solutions.Rmd
	R -e "rmarkdown::render('$<')"
