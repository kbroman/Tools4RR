R_OPTS=--no-save --no-restore --no-init-file --no-site-file # --vanilla, but without --no-environ

example.html: example.R
	R ${R_OPTS} -e 'library(knitr);spin("example.R")'

clean:
	rm example.md example.html
