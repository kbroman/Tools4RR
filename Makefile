all: outline.html schedule.html flyer.pdf room_notice.pdf classlist.pdf

outline.html: outline.md
	Rscript -e 'library(markdown);markdownToHTML("outline.md", "outline.html")'

schedule.md: schedule_template.md schedule4web.md Ruby/fill_schedule.rb
	Ruby/fill_schedule.rb

schedule.html: schedule.md
	Rscript -e 'library(markdown);markdownToHTML("schedule.md", "schedule.html")'

flyer.tex: flyer_template.tex schedule.md Ruby/fill_flyer.rb
	Ruby/fill_flyer.rb

flyer.pdf: flyer.tex
	pdflatex flyer
	pdflatex flyer

room_notice.pdf: room_notice.tex room_notice.png
	pdflatex room_notice

classlist.pdf: classlist.tex
	pdflatex classlist

clean:
	rm outline.html schedule.html flyer.pdf *.aux *.log *~
