---
layout: page
title: Tools for Reproducible Research
tagline: Spring, 2016
description: A course on tools for reproducible research, UW-Madison
---


#### Course summary

A minimal standard for data analysis and other scientific computations is
that they be _reproducible_: that the code and data are assembled in a
way so that another group can re-create all of the results (e.g., the
figures in a paper). The importance of such reproducibility is now
widely recognized, but it is still not so widely practiced as it
should be, in large part because many computational scientists (and
particularly statisticians) have
not fully adopted the required tools for reproducible research.

In this course, we will discuss general principles for reproducible
research but will focus primarily on the use of relevant tools
(particularly [make](http://www.gnu.org/software/make/),
[git](http://git-scm.org), and [knitr](http://yihui.name/knitr/)),
with the goal that the students leave the course ready and willing to
ensure that all aspects of their computational research (software,
data analyses, papers, presentations, posters) are reproducible.


---

#### Details

**Course number**: BMI 826-003

**Instructor**: [Karl Broman](http://kbroman.org),
  [2126 Genetics-Biotechnology](http://map.wisc.edu/s/2tie3nen)

**Prerequisite**: Some knowledge of [R](http://www.r-project.org).

**Lectures**: Fridays, 11:00&ndash;11:50am,
[2321 Engineering Hall](http://map.wisc.edu/s/mhoi6s1u)

**Office hours**: Wed 2:30&ndash;3:30pm (or by
  appointment)

**[Schedule](pages/schedule.html)** (_<font color="#9411dB">with links to lecture notes</font>_)

**[Resources and further reading](pages/resources.html)**

**Recommended books** <br>
&nbsp; &nbsp; C Gandrud, _[Reproducible research with R and RStudio](http://www.amazon.com/exec/obidos/ASIN/1466572841/7210-20)_<br>
&nbsp; &nbsp; Y Xie, _[Dynamic documents with R and knitr](http://www.amazon.com/exec/obidos/ASIN/1482203537/7210-20)_

**Project**: There will be one small project, developed over the course of
the semester:

- Implement something in [R](http://www.r-project.org) (e.g., simulation + fancy plot).
- Develop it in a [git](http://git-scm.com) repository on
    [github](http://github.com) or [bitbucket](http://bitbucket.org).
- Make it an [R](http://www.r-project.org) package.
- Use [knitr](http://yihui.name/knitr/) to make a [vignette](http://cran.us.r-project.org/doc/manuals/R-exts.html#Writing-package-vignettes).
- Use [testthat](https://github.com/hadley/testthat) to include a unit
  test.
- Make sure it passes `R CMD check`.

---

Sources on [github](http://github.com):

- The [source for the website](https://github.com/kbroman/Tools4RR/tree/gh-pages)
- The [source for other material (e.g., lecture slides)](https://github.com/kbroman/Tools4RR/tree/master)
