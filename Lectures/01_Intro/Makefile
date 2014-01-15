lec01.pdf: lec01.tex
	xelatex lec01

notes: lec01_withnotes.pdf

all: lec01.pdf notes

lec01_withnotes.pdf: lec01_withnotes.tex
	xelatex lec01_withnotes
	pdfnup lec01_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv lec01_withnotes-nup.pdf lec01_withnotes.pdf

lec01_withnotes.tex: lec01.tex ../createVersionWithNotes.rb
	../createVersionWithNotes.rb lec01.tex lec01_withnotes.tex
