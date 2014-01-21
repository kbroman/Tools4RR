04_git.pdf: 04_git.tex
	xelatex 04_git

notes: 04_git_withnotes.pdf

all: 04_git.pdf notes

04_git_withnotes.pdf: 04_git_withnotes.tex
	xelatex 04_git_withnotes
	pdfnup 04_git_withnotes.pdf --nup 1x2 --no-landscape --paper letterpaper --frame true --scale 0.9
	mv 04_git_withnotes-nup.pdf 04_git_withnotes.pdf

04_git_withnotes.tex: 04_git.tex ../createVersionWithNotes.rb
	../createVersionWithNotes.rb 04_git.tex 04_git_withnotes.tex
