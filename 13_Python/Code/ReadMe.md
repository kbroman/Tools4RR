## Example Python script to convert genotype data files

Python version of the [long example perl script](http://www.biostat.wisc.edu/~kbroman/perlintro/index.html#ex2) in my
[Intro to perl](http://www.biostat.wisc.edu/~kbroman/perlintro/).

The goal is to take three files obtained from a collaborator (genotype
data, family info, and order of markers) and combine them into a
single file in the format used by the CRI-MAP program.

- [`genotypes.txt`](genotypes.txt) &mdash; genotype data
- [`families.txt`](families.txt) &mdash; family information
- [`markers.txt`](markers.txt) &mdash; ordered markers

- [`data_save.gen`](data_save.gen) &mdash; desired output file

- [`convert2.py`](convert2.py) &mdash; python 2 version of script
- [`convert3.py`](convert3.py) &mdash; python 3 version of script

Also see the [Ruby version](https://github.com/kbroman/RubyBroman/blob/master/ParseGenotypeData/convert.rb).
