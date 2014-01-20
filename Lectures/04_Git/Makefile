lec04.pdf: lec04.tex
	xelatex lec04

notes: lec04_withnotes.pdf

all: lec04.pdf notes

lec04_withnotes.pdf: lec04_withnotes.tex
	xelatex lec04_withnotes
	pdfnup lec04_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv lec04_withnotes-nup.pdf lec04_withnotes.pdf

lec04_withnotes.tex: lec04.tex ../createVersionWithNotes.rb
	../createVersionWithNotes.rb lec04.tex lec04_withnotes.tex
