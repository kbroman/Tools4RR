LEC = assets/lectures
HW = assets/homework

all: lectures homework

lectures: ${LEC}/01_intro.pdf ${LEC}/01_intro_withnotes.pdf ${LEC}/02_unix.pdf ${LEC}/02_unix_withnotes.pdf ${LEC}/03_knitr_Rmd.pdf ${LEC}/03_knitr_Rmd_withnotes.pdf ${LEC}/04_git.pdf ${LEC}/04_git_withnotes.pdf ${LEC}/06_org_eda.pdf ${LEC}/06_org_eda_withnotes.pdf ${LEC}/07_clearcode.pdf ${LEC}/07_clearcode_withnotes.pdf ${LEC}/08_rpack.pdf ${LEC}/08_rpack_withnotes.pdf ${LEC}/09_testdebug.pdf ${LEC}/09_testdebug_withnotes.pdf ${LEC}/10_bigjobs.pdf ${LEC}/10_bigjobs_withnotes.pdf ${LEC}/11_knitrpapers.pdf ${LEC}/11_knitrpapers_withnotes.pdf ${LEC}/12_talks_posters.pdf ${LEC}/12_talks_posters_withnotes.pdf ${LEC}/13_python.pdf ${LEC}/13_python_withnotes.pdf ${LEC}/15_licenses.pdf ${LEC}/15_licenses_withnotes.pdf

homework: ${HW}/01_homework.pdf ${HW}/02_homework.pdf ${HW}/02_hw_solutions.pdf ${HW}/02_homework.R ${HW}/03_homework.pdf ${HW}/03_hw_solutions.Rmd ${HW}/03_hw_solutions.html $(HW)/04_homework.pdf $(HW)/06_homework.pdf

${LEC}/01%.pdf: ../01_Intro/01%.pdf
	cp $< $@

${HW}/01%.pdf: ../01_Intro/01%.pdf
	cp $< $@

${LEC}/02%.pdf: ../02_Unix/02%.pdf
	cp $< $@

${HW}/02%.pdf: ../02_Unix/02%.pdf
	cp $< $@

${HW}/02%.R: ../02_Unix/02%.R
	cp $< $@

${LEC}/03%.pdf: ../03_KnitrMarkdown/03%.pdf
	cp $< $@

${HW}/03%.pdf: ../03_KnitrMarkdown/03%.pdf
	cp $< $@

${HW}/03%.Rmd: ../03_KnitrMarkdown/03%.Rmd
	cp $< $@

${HW}/03%.html: ../03_KnitrMarkdown/03%.html
	cp $< $@

${LEC}/04%.pdf: ../04_Git/04%.pdf
	cp $< $@

${HW}/04%.pdf: ../04_Git/04%.pdf
	cp $< $@

${LEC}/05%.pdf: ../05_Git_Lab/05%.pdf
	cp $< $@

${LEC}/06%.pdf: ../06_Organization_EDA/06%.pdf
	cp $< $@

${HW}/06%.pdf: ../06_Organization_EDA/06%.pdf
	cp $< $@

${LEC}/07%.pdf: ../07_ClearCode/07%.pdf
	cp $< $@

${LEC}/08%.pdf: ../08_Rpack/08%.pdf
	cp $< $@

${LEC}/09%.pdf: ../09_TestingDebugging/09%.pdf
	cp $< $@

${LEC}/10%.pdf: ../10_BigJobs/10%.pdf
	cp $< $@

${LEC}/11%.pdf: ../11_KnitrPapers/11%.pdf
	cp $< $@

${LEC}/12%.pdf: ../12_KnitrTalksPosters/12%.pdf
	cp $< $@

${LEC}/13%.pdf: ../13_Python/13%.pdf
	cp $< $@

${LEC}/14%.pdf: ../14_Python_Lab/14%.pdf
	cp $< $@

${LEC}/15%.pdf: ../15_Licenses/15%.pdf
	cp $< $@
