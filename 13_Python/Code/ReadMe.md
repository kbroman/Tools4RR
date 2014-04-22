## Example Python script to convert genotype data files

The main example in the lecture is a Python version of the
[long example perl script](http://www.biostat.wisc.edu/~kbroman/perlintro/index.html#ex2)
in my
[Intro to perl](http://www.biostat.wisc.edu/~kbroman/perlintro/) tutorial.
Also see the [Ruby version](https://github.com/kbroman/RubyBroman/blob/master/ParseGenotypeData/convert.rb).

The goal is to take three files obtained from a collaborator (genotype
data, family info, and order of markers) and combine them into a
single file in the format used by the CRI-MAP program.

- [`genotypes.txt`](genotypes.txt) &mdash; genotype data
- [`families.txt`](families.txt) &mdash; family information
- [`markers.txt`](markers.txt) &mdash; ordered markers
- [`data_save.gen`](data_save.gen) &mdash; desired output file
- [`convert2.py`](convert2.py) &mdash; python 2 version of script
- [`convert3.py`](convert3.py) &mdash; python 3 version of script


Here are Python scripts with the other code in the lecture:

- [`other_code2.py`](other_code2.py) &mdash; python 2 version
- [`other_code3.py`](other_code3.py) &mdash; python 3 version


Here are scripts for a unit test of one of the functions in the main
example.

- [`nosetest_convert2.py`](nosetest_convert2.py) &mdash; unit test for one of
  the functions in [`convert2.py`](convert2.py), using [nose](https://nose.readthedocs.org/en/latest/)
- [`nosetest_convert3.py`](nosetest_convert3.py) &mdash; unit test for one of
  the functions in [`convert3.py`](convert3.py), using [nose](https://nose.readthedocs.org/en/latest/)
- [`test_convert2.py`](test_convert2.py) &mdash; unit test for one of
  the functions in [`convert2.py`](convert2.py), using the standard
  Python [unittest module](https://docs.python.org/2/library/unittest.html)
- [`test_convert3.py`](test_convert3.py) &mdash; unit test for one of
  the functions in [`convert3.py`](convert3.py), using the standard
  Python [unittest module](https://docs.python.org/3/library/unittest.html)

