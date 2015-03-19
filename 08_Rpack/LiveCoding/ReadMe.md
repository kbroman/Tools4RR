# Live coding to illustrate construction of an R package.

1. Create a subdirectory `simBM` and change into that directory.

        mkdir simBM
        cd simBM

2. Initialize it as a git repository and make connection on GitHub.

3. Write an R file with some code.

        touch simBM.R

   Write a function `simBM()` for simulating Brownian motion, with
   parameters `n` and `sigma`. Try it out. Plot the results. Then
   write a function to make a plot, `plotBM()`.

4. Create an `R/` subdirectory and move the R code there.

        mkdir R
        mv simBM.R R/

5. Create a `DESCRIPTION` file with just:

        Package: simBM
        Version: 0.1

6. Go back one directory and try build and install.

        R CMD build simBM
        R CMD INSTALL --library=/Users/kbroman/Rlibs simBM_0.1.tar.gz

7. Go into R, load the library, and try it out. Within R:

        library(simBM)
        x <- simBM(10000)
        plotBM(x)

8. Go back to the command line and run `R CMD check`.

        R CMD check simBM_0.1.tar.gz

9. Point out the bit about the `NAMESPACE` file.

10. Go back to the `DESCRIPTION` file and add the following lines:

        Title: Simulate Brownian motion
        Description: Simulate and plot two-dimensional Brownian motion
        License: MIT + file LICENSE
        Author: Karl Broman <kbroman@biostat.wisc.edu>
        Maintainer: Karl Broman <kbroman@biostat.wisc.edu>

11. Also add a license file with this:

        YEAR: 2015
        COPYRIGHT HOLDER: Karl Broman

12. Go back to the command line and run build, install, and check.

13. Talk about R documentation and Roxygen2.

14. Add Roxygen2 comments to the R code: title, description, `@param`,
    `@result`, `@example`, `@export`

15. Run Roxygen2 to create the documentation.

        library(devtools)
        document()

16. Build, install, and check within R.

        build()
        install()
        check()

17. Add in some `@seealso`, for example:

        \code{\link{simBM}}
        \code{\link[graphics]{plot}}

18. Add a `README.md` file.

19. Add a vignette. Look at
    [R/qtlcharts](https://github.com/kbroman/qtlcharts) for the
    requirements.
