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

5. Create an `R/` subdirectory and move the R code there.

        mkdir R
        mv simBM.R R/

6. Create a `DESCRIPTION` file with just:

        Package: simBM
        Version: 0.1

7. Go back one directory and try build and install.

        R CMD build simBM
        R CMD INSTALL --library=/Users/kbroman/Rlibs simBM_0.1.tar.gz

8. Go into R, load the library, and try it out. Within R:

        library(simBM)
        x <- simBM(10000)
        plotBM(x)

9. Go back to the command line and run `R CMD check`.

        R CMD check simBM_0.1.tar.gz

10. Point out the bit about the `NAMESPACE` file, but mostly the error
    is about title, description, license, author, maintainer.

11. Go back to the `DESCRIPTION` file and add the following lines:

        Title: Simulate Brownian motion
        Description: Simulate and plot two-dimensional Brownian motion
        License: MIT + file LICENSE
        Author: Karl Broman <kbroman@biostat.wisc.edu>
        Maintainer: Karl Broman <kbroman@biostat.wisc.edu>

12. Also add a license file with this:

        YEAR: 2015
        COPYRIGHT HOLDER: Karl Broman

13. Go back to the command line and run build, install, and check.

14. Talk about R documentation and Roxygen2.

15. Add Roxygen2 comments to the R code: title, description, `@param`,
    `@result`, `@example`, `@export`

16. Run Roxygen2 to create the documentation.

        library(devtools)
        document()

17. Build, install, and check within R.

        build()
        install()
        check()

18. Add in some `@seealso`, for example:

        \code{\link{simBM}}
        \code{\link[graphics]{plot}}

19. Add a `README.md` file.

20. Add a vignette. Look at
    [R/qtlcharts](https://github.com/kbroman/qtlcharts) for the
    requirements. Need the `vignettes` subdirectory, and `.Rmd` file,
    the special stuff in the YAML header, and then a couple of things
    in the `DESCRIPTION` file.

21. Build, install, check within R. The install part needs:

        install(build_vignettes=TRUE)

22. Show how to view the vignette within R.

        library(simBM)
        vignette(package="simBM")
        vignette("simBM", "simBM")
