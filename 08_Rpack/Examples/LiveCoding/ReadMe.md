# Live coding to illustrate construction of an R package.

1. Create a subdirectory `simBM` and change into that directory.

        mkdir simBM
        cd simBM

2. Write an R file with some code.

        touch simBM.R

3. Create an `R/` subdirectory and move the R code there.

        mkdir R
        mv simBM.R R/

4. Create a `DESCRIPTION` file with just:

        Package: simBM
        Version: 0.1

5. Go back one directory and try build and install.

        R CMD build simBM
        R CMD INSTALL --library=/Users/kbroman/Rlibs simBM_0.1.tar.gz

6. Go into R, load the library, and try it out. Within R:

        library(simBM)
        x <- simBM(10000)
        plotBM(x)

7. Go back to the command line and run `R CMD check`.

        R CMD check simBM_0.1.tar.gz

8. Point out the bit about the `NAMESPACE` file.

9. Go back to the `DESCRIPTION` file and add the following lines:

        Title: Simulate Brownian motion
        Description: Simulate and plot two-dimensional Brownian motion
        License: MIT + file LICENSE
        Author: Karl Broman <kbroman@biostat.wisc.edu>
        Maintainer: Karl Broman <kbroman@biostat.wisc.edu>

10. Also add a license file with this:

        YEAR: 2015
        COPYRIGHT HOLDER: Karl Broman

11. Go back to the command line and run build, install, and check.

12. Talk about R documentation and Roxygen2.

13. Add Roxygen2 comments to the R code: title, description, `@param`,
    `@result`, `@example`, `@export`

14. Run Roxygen2 to create the documentation.

        library(devtools)
        document()

15. Build, install, and check within R.

        build()
        install()
        check()
