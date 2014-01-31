02_unix.pdf: 02_unix.tex
	xelatex 02_unix

notes: 02_unix_withnotes.pdf 02_unix_onlynotes.pdf

all: 02_unix.pdf notes web

02_unix_withnotes.pdf: 02_unix_withnotes.tex
	xelatex 02_unix_withnotes
	pdfnup 02_unix_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv 02_unix_withnotes-nup.pdf 02_unix_withnotes.pdf

02_unix_onlynotes.pdf: 02_unix_onlynotes.tex
	xelatex 02_unix_onlynotes

02_unix_withnotes.tex: 02_unix.tex ../createVersionWithNotes.rb
	../createVersionWithNotes.rb 02_unix.tex 02_unix_withnotes.tex

02_unix_onlynotes.tex: 02_unix.tex ../createVersionOnlyNotes.rb
	../createVersionOnlyNotes.rb 02_unix.tex 02_unix_onlynotes.tex

web: 02_unix.pdf 02_unix_withnotes.pdf
	cp 02_unix.pdf 02_unix_withnotes.pdf ../../Web/assets/lectures/
