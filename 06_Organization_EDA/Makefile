LEC = 06_org_eda

WEBDIR = ../Web/assets/lectures
DROPBOXDIR = ~/Dropbox/Teaching/Tools4RR

${LEC}.pdf: ${LEC}.tex
	xelatex ${LEC}

notes: ${LEC}_withnotes.pdf
pdf: ${LEC}.pdf notes
all: ${LEC}.pdf notes web dropbox

${LEC}_withnotes.pdf: ${LEC}_withnotes.tex
	xelatex ${LEC}_withnotes
	pdfnup ${LEC}_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv ${LEC}_withnotes-nup.pdf ${LEC}_withnotes.pdf

${LEC}_withnotes.tex: ${LEC}.tex ../Ruby/createVersionWithNotes.rb
	../Ruby/createVersionWithNotes.rb ${LEC}.tex ${LEC}_withnotes.tex

web: ${WEBDIR}/${LEC}.pdf ${WEBDIR}/${LEC}_withnotes.pdf

${WEBDIR}/${LEC}.pdf: ${LEC}.pdf
	cp ${LEC}.pdf ${WEBDIR}/

${WEBDIR}/${LEC}_withnotes.pdf: ${LEC}_withnotes.pdf
	cp ${LEC}_withnotes.pdf ${WEBDIR}/

dropbox: ${DROPBOXDIR}/${LEC}_withnotes.pdf

${DROPBOXDIR}/${LEC}_withnotes.pdf: ${LEC}_withnotes.pdf
	cp ${LEC}_withnotes.pdf ${DROPBOXDIR}/

clean:
	rm *.aux *.log *.nav *.out *.snm *.toc *.vrb
