all: git_lab.html git_lab.pdf

git_lab.html: git_lab.md
	R -e "rmarkdown::render('git_lab.md', output_format='html_document')"

git_lab.pdf: git_lab.md
	R -e "rmarkdown::render('git_lab.md', output_format='pdf_document')"
