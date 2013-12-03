<link href="http://kevinburke.bitbucket.org/markdowncss/markdown.css" rel="stylesheet"></link>
<link href="markdown_modified.css" rel="stylesheet"></link>

## Tools for Reproducible Research

### Draft outline, Spring 2014


#### Jan 24: Basic principles
 - replicable vs reproducible
 - need "pipeline": data & code available and use documented
 - "best practices" more generally...
 - I don't have all of the answers, and my not do things in the most
   efficient way possible.
 - finding answers to questions:
   - help files / manual pages
   - google
   - [stackoverflow](http://stackoverflow.com)
   - email lists / google groups
   - friends / colleagues
 - Get the data in the most-raw form possible
 - Be sure to get any/all data and meta-data possible
 - Keep track of the "provenance" of all data files
 - Don't repeat yourself
   - code; documentation, ...
   - for example: materials for web site and for advertisement
 - Be self-sufficient
 - Automation with make
 - "You" 3 months in the future is effectively a different person
 - It's a lot more work to do things properly, but it could save you a
   ton of aggravation down the road.
 - `make` is not just a critical tool, it is also the essence of what
   we're trying to do: document dependencies and automate processes
   ("How was this document created?" _Look at the `Makefile`_)

if the data are updated (eg, additional subjects)
or you find some artifact that needs fixing
Can you just "press a button" to update?

need to avoid:
- opening file to extract csv or do even slight edit
- copy/paste image into powerpoint
- hand-enter table or individual value


Levels of quality:
- Are the tables & figures reproducible from the code and data?
- Does the code actually do what you think it does?
- In addition to _what_ was done, is it clear _why_ it was done?
  (e.g., how were parameter settings chosen)
- Can the code be used for other data?
- Can you extend the code to do other things?


---

#### Jan 31: Know the command line; know your editor

Point-and-click is _not_ reproducible.

Taking your hands off the keyboard means loss of efficiency

Command-line allows you to piece together multiple tools and so do
things that weren't anticipated by the developer of the GUI.

Editors:
 - emacs with ESS
 - vim
 - Rstudio
 - textwrangler
 - notepad++
 - Tinn-R

Use relative paths rather than absolute paths, and don't jump out of
the current directory.

Regarding the command line:
- `<`, `>`, `|`
- `&`, `ctrl-Z`, `fg`
- `grep`
- flags/arguments
- What is a shell?
- [Essential Unix commands](http://www.english.upenn.edu/~curran/205-505/unix.html)
- [Basic Unix commands](http://www.tjhsst.edu/~dhyatt/superap/unixcmd.html)
- [Command line essentials (slides)](http://www.slideshare.net/bbbart/command-line-essentials)
- [How to look like a unix guru](http://www.cs.usfca.edu/~parrt/course/601/lectures/unix.util.html)
- [Linux essentials](http://faculty.ucr.edu/~tgirke/Documents/UNIX/linux_manual.html)
- [Important unix commands](http://www.personal.kent.edu/~rmuhamma/OpSystems/unixCommands.htm)

---

#### Feb 7:  Knitr with markdown/asciidoc for basic reports

- including figures and tables
  ([xtable](http://cran.r-project.org/web/packages/xtable/index.html)
  to html or asciidoc tables with the
  [ascii package](https://github.com/eusebe/ascii/)
- *Important principle*: modify your desires to match the
  defaults. Focus your compulsive behavior on things that matter.
  - The actual text
  - How the text appears on the page
  - The graphs
  - Which is more important: manuscript, web page, blog, grant, course
    handout, report to collaborator, scientific poster
- Start report with a brief summary of the data, and of your
    understanding of the data and the questions
- Useful anecdote: Bruce Tempel data.
  - I sent him a report; included no. mice in the exper't
  - He could tell I had an old data set ("Sorry you put so much
    effort into that; we'll help you find the correct data")
  - complicated story: one RData file had two different crosses, one
    complete one half-way; the other had a later complete version of
    the previously incomplete cross. I loaded the files in the wrong
    order
  - 20 min of confusion in figuring out the problem, but then just 5
    min to correct things. Literally 25 min: I sent him the report
    at 10:22pm, he reported the problem at 12:18am, and I sent him
    the correction at 12:43am.

---

#### Feb 14: Version control with git & github/bitbucket

 - Also, facilities through Rstudio

---

#### Feb 21: Organizing data analysis projects

For yourself, or for you and many others...

- Where to put data that multiple people will work with?
- Where to put intermediate/processed data?
- Where to indicate the code that created those processed data files?
- How to name stuff
- How to coordinate on data cleaning and analysis?
- Example: [xkcd re date formats](http://xkcd.com/1179/)
- Don't put spaces in file names!
- Use relative paths (`../blah`) not absolute paths (`/users/blah`)
- Softlinks (and hardlinks?)
- Need to agree on directory structure and file naming conventions
- separate raw data (untouched) from derived data and summaries
- stages for clean data?
- How to divvy up tasks and know who did what?
- How to handle the case that a contributor refuses to learn version
  control?

---

#### Feb 28: Capturing exploratory analysis

---

#### Mar 7:  Writing clear code

 - Break things up into small functions
 - Don't repeat yourself
 - Use meaningful names
 - Don't be cute

Example: [tweet re function names](https://twitter.com/richierocks/status/388609208293556224)

---

#### Mar 14: Writing R packages; Roxygen2

 - Assemble related code into a package, with help files
 - Write a package for your own miscellaneous tools
 - [Jeff Leek on developing R packages](https://github.com/jtleek/rpackages)
 - `install_github`

---

#### Mar 28: Software testing and debugging

 - testthat package
 - [Hadley Wickham's paper](http://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf)
 - R CMD CHECK

---

#### Apr 4: Big jobs/simulations; caching computations

---

#### Apr 11:  Knitr with latex for papers

- including figures and tables

---

#### Apr 18: Presentations

---

#### Apr 25: Posters

---

#### May 2:  Ruby/python/perl for data/text manipulation

---

#### May 9:  Software/data licenses, copyright, and human subjects/HIPPA

 - good overall ref?
 - GPL, MIT, BSD, WTFPL
 - [coding horror blog](http://www.codinghorror.com/blog/2007/04/pick-a-license-any-license.html)
 - HIPPA / human subjects


---

#### Other resources

- [roger peng slides](http://www.stodden.net/AMP2011/slides/pengslides.pdf)
- [yihui slides](http://yihui.name/slides/2012-knitr-RStudio.html)
- Victoria Stodden course: ([guidelines](http://bioinformatics.mdanderson.org/Supplements/ReproRsch-All/Modified/ENAR/stoddenCourseGuidelines.pdf) | [syllabus](http://bioinformatics.mdanderson.org/Supplements/ReproRsch-All/Modified/ENAR/stoddenCourseSyllabus.pdf))
- [ReproducibleResearch.net](http://reproducibleresearch.net)
- [Reproducible Research and Software Carpentry course](https://sites.google.com/site/ubccpsc535zwinter2011/home/lectures) at UBC
- [Reproducible Research in Signal Processing - What, why, and how](http://infoscience.epfl.ch/record/136640)
- [Software Carpentry](http://software-carpentry.org/)
- Roger Peng's 2009 ENAR course: [Methods for Reproducible Research](http://www.biostat.jhsph.edu/~rpeng/ENAR2009/)
- [UW-Madison software carpentry course](http://software-carpentry.org/bootcamps/2013-08-28-wisc/index.html)
  and [schedule](http://uw-madison-aci.github.io/boot-camps/2013-08-28-uwmadison/index.html)
- [Software carpentry notes on git](https://github.com/swcarpentry/boot-camps/blob/master/version-control/git/git-and-github/instructor_notes.md)
- [Software carpentry course template](https://github.com/swcarpentry/bc)
- [Success in introductory programming: what works (paper)](http://dl.acm.org/citation.cfm?id=2492020)
- [Best Practices for Scientific Computing (pdf)](http://arxiv.org/abs/1210.0530)
- [Ten simple rules for reproducible computational research (paper)](http://www.ploscompbiol.org/article/info:doi/10.1371/journal.pcbi.1003285)
- [rOpenSci](http://ropensci.org/) book, [Open Science with R](https://github.com/ropensci/open-science-with-R)

#### Additional software tools

- [SyncTeX](http://itexmac.sourceforge.net/SyncTeX.html)
  (Also see [MacTeX wiki](http://mactex-wiki.tug.org/wiki/index.php/SyncTeX))
