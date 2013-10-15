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
 - Be self-sufficient
 - Automation with make
 - "You" 3 months in the future is effectively a different person


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

---

#### Feb 7:  Knitr with markdown/asciidoc for basic reports

- including figures and tables
  ([xtable](http://cran.r-project.org/web/packages/xtable/index.html)
  to html or asciidoc tables with the
  [ascii package](https://github.com/eusebe/ascii/)


---

#### Feb 14: Big jobs/simulations; caching computations

---

#### Feb 21: Version control with git & github/bitbucket

 - Also, facilities through Rstudio

---

#### Feb 28: Capturing exploratory analysis

---

#### Mar 7: Writing R packages; Roxygen2

 - Assemble related code into a package, with help files
 - Write a package for your own miscellaneous tools
 - [Jeff Leek on developing R packages](https://github.com/jtleek/rpackages)

---

#### Mar 14:  Writing clear code

 - Break things up into small functions
 - Don't repeat yourself
 - Use meaningful names
 - Don't be cute

Example: [tweet re function names](https://twitter.com/richierocks/status/388609208293556224)

---

#### Mar 28: Software testing and debugging

 - testthat package
 - [Hadley Wickham's paper](http://journal.r-project.org/archive/2011-1/RJournal_2011-1_Wickham.pdf)

---

#### Apr 4: Organizing data analysis projects

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
