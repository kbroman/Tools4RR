01_intro.pdf: 01_intro.tex
	xelatex 01_intro

notes: 01_intro_withnotes.pdf

all: 01_intro.pdf notes web

01_intro_withnotes.pdf: 01_intro_withnotes.tex
	xelatex 01_intro_withnotes
	pdfnup 01_intro_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv 01_intro_withnotes-nup.pdf 01_intro_withnotes.pdf

01_intro_withnotes.tex: 01_intro.tex ../createVersionWithNotes.rb
	../createVersionWithNotes.rb 01_intro.tex 01_intro_withnotes.tex

web: 01_intro.pdf 01_intro_withnotes.pdf
	cp 01_intro.pdf 01_intro_withnotes.pdf ../../Web/assets/lectures/
