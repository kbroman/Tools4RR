## Simple Make examples

`Makefile` is a simple make file for compiling a Latex manuscript with
R-based figures.

`Makefile_fancy` is a slightly fancier one; see the
[manual for Make](http://www.gnu.org/software/make/manual/make.html).

- [Variables and variable references](http://www.gnu.org/software/make/manual/make.html#Using-Variables):

    FIG_DIR = Figs
    ${FIG_DIR}/fig1.pdf

- [Pattern rules](http://www.gnu.org/software/make/manual/make.html#Pattern-Rules) (`%`):

    ${FIG_DIR}/%.pdf: R/%.R

- [Automatic Variables](http://www.gnu.org/software/make/manual/make.html#Automatic-Variables) (e.g. `$(<F)`):

    cd R;R CMD BATCH $(<F)

    
