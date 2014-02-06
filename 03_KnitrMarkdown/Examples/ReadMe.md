### Example of knitr with R Markdown

`example1.Rmd` is a simple example of an
[R Markdown](http://www.rstudio.com/ide/docs/r_markdown) file,
combining R code and
[Markdown](http://daringfireball.net/projects/markdown/), and with the
ability to use [MathJax](http://www.mathjax.org/) to include
[LaTeX](http://www.latex-project.org/)-type code for equations.

`example2.asciidoc` is a simple example of a
file combining R and [asciidoc](http://www.methods.co.nz/asciidoc/).
AsciiDoc is more complicated (but has more features) than Markdown.
(Note that I've decided not to try to cover AsciiDoc in this course;
it's best to focus.)

`Makefile` is the [GNU make](http://www.gnu.org/software/make) file
for using [knitr](http://yihui.name/knitr/) to convert the R Markdown
and asciidoc files to html.

