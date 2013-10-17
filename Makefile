all: outline.html schedule.html flyer.pdf

outline.html: outline.md
	Rscript -e 'library(markdown);markdownToHTML("outline.md", "outline.html")'

schedule.html: schedule.md
	Rscript -e 'library(markdown);markdownToHTML("schedule.md", "schedule.html")'

flyer.pdf: flyer.tex
	pdflatex flyer
	pdflatex flyer

clean:
	rm outline.html schedule.html flyer.pdf *.aux *.log *~
