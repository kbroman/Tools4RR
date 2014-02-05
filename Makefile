all: Notes/outline.html Handouts/schedule.html Handouts/flyer.pdf Handouts/room_notice.pdf Handouts/classlist.pdf

Notes/outline.html: Notes/outline.md
	cd Notes;Rscript -e 'library(markdown);markdownToHTML("outline.md", "outline.html")'

Handouts/schedule.md: Handouts/schedule_template.md Handouts/schedule4web.md Ruby/fill_schedule.rb
	Ruby/fill_schedule.rb

Handouts/schedule.html: Handouts/schedule.md
	cd Handouts;Rscript -e 'library(markdown);markdownToHTML("schedule.md", "schedule.html")'

Handouts/flyer.tex: Handouts/flyer_template.tex Handouts/schedule.md Ruby/fill_flyer.rb
	Ruby/fill_flyer.rb

Handouts/flyer.pdf: Handouts/flyer.tex
	cd Handouts;pdflatex flyer
	cd Handouts;pdflatex flyer

Handouts/room_notice.pdf: Handouts/room_notice.tex Handouts/room_notice.png
	cd Handouts;pdflatex room_notice

Handouts/classlist.pdf: Handouts/classlist.tex
	cd Handouts;pdflatex classlist

clean:
	rm Handouts/outline.html Handouts/schedule.html Handouts/flyer.pdf Handouts/*.aux Handouts/*.log Handouts/*~
