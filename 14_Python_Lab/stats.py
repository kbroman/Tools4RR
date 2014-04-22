#!/usr/bin/env python
#
# Python lab
#
# Run this as
#
#  stats.py filename
#
# You can leave off the filename, in which case it is taken to be "data.csv"
#
# Fill in the body of the functions below, to
# read in csv file and for each column calculate
#  - Number of non-missing values
#  - Mean
#  - Median
#  - SD

import math



def read_csv (filename):
  "Read in a CSV file as a matrix stored by rows"
  # return a tuple (colnames, matrix)
  # with colnames = vector of column names
  # matrix = matrix, stored by rows



def transpose_matrix (matrix):
  "Transpose a matrix so that it's stored by columns"
  # return the matrix, stored by columns



def strip_NA (vect):
  "Strip 'NA' values from a vector and convert to floats"
  # return the portion of the vect that is not 'NA',
  # with strings converted to floats



def count_missing (vect):
  """Count the number of missing values in a vector;
missing values assumed to be 'NA'."""
  # return a count of the number of missing values
  # in the input vector



def count_notmissing (vect):
  """Count the number of non-missing values in a vector;
missing values assumed to be 'NA'."""
  # return a count of the number of non-missing values
  # in the input vector



def mean (vect):
  "Calculate the mean of a vector; missing values assumed to be 'NA'."
  # return the mean of the input vect, omitting 'NA' values



def median (vect):
  "Calculate the median of a vector; missing values assumed to be 'NA'."
  # return the median of the input vect, omitting 'NA' values



def sd (vect):
  "Calculate the SD of a vector; missing values assumed to be 'NA'."
  # return the SD of the input vect, ommiting 'NA' values



if __name__ == '__main__':
  # get file name from command line; otherwise "data.csv"
  import sys
  args = sys.argv
  file = "data.csv" if len(args)<=1 else args[1]

  # read data matrix
  colnames, mat = read_csv(file)

  # transpose matrix so it's organized by columns
  tmat = transpose_matrix(mat)

  # print results
  print("    %6s %3s %7s %7s %7s" % ("column", "n", "mean", "median", "SD"))
  for i in range(len(tmat)):
    col = tmat[i]
    print("    %6s %3d %7.3f %7.3f %7.3f" % (colnames[i], count_notmissing(col), mean(col), median(col), sd(col)))
