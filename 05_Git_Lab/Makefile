all: git_lab.html git_lab.pdf

git_lab.html: git_lab.md
	R -e 'library(markdown);markdownToHTML("git_lab.md", "git_lab.html")'

git_lab.pdf: git_lab.md
	pandoc git_lab.md -o git_lab.pdf
