# Live coding to illustrate construction of an R package.

1. Create a subdirectory `simBM` and change into that directory.

        mkdir simBM
        cd simBM

2. Initialize it as a git repository and make connection on GitHub.

3. Write an R file with some code.

        touch simBM.R

   Write a function `simBM()` for simulating Brownian motion, with
   parameters `n` and `sigma`. Try it out. Plot the results. Then
   turn the code for plotting into another function, `plotBM()`.

4. Push things to github. Then periodically, below, do `git add`,
   `git commit`, `git push`.

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

9. Point out the bit about the `NAMESPACE` file, but mostly the error
   is about title, description, license, author, maintainer.

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
    requirements. Need the `vignettes` subdirectory, and `.Rmd` file,
    the special stuff in the YAML header, and then a couple of things
    in the `DESCRIPTION` file.

20. Build, install, check within R. The install part needs:

        install(build_vignettes=TRUE)

21. Show how to view the vignette within R.

        library(simBM)
        vignette(package="simBM")
        vignette("simBM", "simBM")
