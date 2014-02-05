LEC = 03_knitr_Rmd

${LEC}.pdf: ${LEC}.tex
	xelatex ${LEC}

notes: ${LEC}_withnotes.pdf
all: ${LEC}.pdf notes web
pdf: ${LEC}.pdf notes

${LEC}_withnotes.pdf: ${LEC}_withnotes.tex
	xelatex ${LEC}_withnotes
	pdfnup ${LEC}_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv ${LEC}_withnotes-nup.pdf ${LEC}_withnotes.pdf

${LEC}_withnotes.tex: ${LEC}.tex ../createVersionWithNotes.rb
	../createVersionWithNotes.rb ${LEC}.tex ${LEC}_withnotes.tex

WEBDIR = ../../Web/assets/lectures

web: ${WEBDIR}/${LEC}.pdf ${WEBDIR}/${LEC}_withnotes.pdf

${WEBDIR}/${LEC}.pdf: ${LEC}.pdf
	cp ${LEC}.pdf ${WEBDIR}

${WEBDIR}/${LEC}_withnotes.pdf: ${LEC}_withnotes.pdf
	cp ${LEC}_withnotes.pdf ${WEBDIR}
