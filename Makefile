all: outline.html schedule.html

outline.html: outline.md
	Rscript -e 'library(markdown);markdownToHTML("outline.md", "outline.html")'
schedule.html: schedule.md
	Rscript -e 'library(markdown);markdownToHTML("schedule.md", "schedule.html")'

clean:
	rm outline.html schedule.html *~
