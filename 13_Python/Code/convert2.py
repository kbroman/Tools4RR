#!/usr/bin/env python
# Combine the data in "genotypes.txt", "markers.txt" and "families.txt"
# and convert them into a CRI-MAP .gen file
#
# This is a python version of the perl script discussed in my "Intro to perl"
# at http://www.biostat.wisc.edu/~kbroman/perlintro/index.html#ex2
#
# This is the python2 version of convert.py

import re

def read_markers (filename):
  with open(filename, 'r') as f:
    lines = f.readlines()
  return [line.strip() for line in lines]

class Person:
  def __init__ (self,family, id, dad, mom, sex):
    self.family = family
    self.id = id
    self.dad = dad
    self.mom = mom
    self.sex = "0" if sex == "2" else sex # convert from 1/2 to 1/0
    self.famid = family + '-' + id
    self.gen = {}

# read family info and return a hash of people
def read_families (filename):
  with open(filename, 'r') as file:
    file.readline() # header row
    people = {}
    for line in file:
      vals = line.strip().split()    # strip removes leading and ending white space
      person = Person(vals[0], vals[1], vals[2], vals[3], vals[4])
      people[person.famid] = person
  return people

# clean up string - > genotype
def parse_genotype (string):
  string = re.sub(r'\s+', '', string)
  string = "0/0" if string == "" else string
  return re.sub(r'/', ' ', string)

# read genotype data, fill in genotypes within people hash
def read_genotypes (filename, people):
  with open(filename, 'r') as file:

    header = file.readline().strip().split()
    header = header[1:] # omit the first field, "Marker"

    for line in file:
      marker = re.sub(r'\s+', '', line[:9])
      line = line[9:]
      for i in range(len(header)):
        person = header[i]
        start = i*7
        people[person].gen[marker] = parse_genotype(line[start:(start+7)])

# distinct families
def get_families (people):
  return set([people[key].family for key in people])

# people within a family
def get_family_members (people, family):
  return [people[key] for key in people if people[key].family == family]

def writeln (file, line, end="\n"):
  file.write(str(line) + end)

def write_genfile (filename, people, markers):
  with open(filename, 'w') as file:

    families = sorted(get_families(people))
    writeln(file, len(families))

    writeln(file, len(markers))
    for marker in markers:
      writeln(file, marker)

    for family in families:
      writeln(file, family)
      members = sorted(get_family_members(people, family), key=lambda person: int(person.id))
      writeln(file, len(members))

      for person in members:
        writeln(file, "%s %s %s %s" % (person.id, person.mom, person.dad, person.sex))

        for marker in markers:
          writeln(file, person.gen[marker], " ")
        writeln(file, "")


if __name__ == '__main__':
  # file names
  gfile = "genotypes.txt" # genotype data
  mfile = "markers.txt"   # list of markers, in order
  ffile = "families.txt"  # family information
  ofile = "data.gen"      # output file

  # read the data
  markers = read_markers(mfile)
  people = read_families(ffile)
  read_genotypes(gfile, people)

  # write the data
  write_genfile(ofile, people, markers)
