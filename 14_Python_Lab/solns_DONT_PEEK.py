#!/usr/bin/env python
#
# Solution to python lab
#
# Read in csv file and for each column calculate
#  - Number of non-missing values
#  - Mean
#  - Median
#  - SD

import math



def read_csv (filename):
  "Read in a CSV file as a matrix stored by rows"
  with open(filename, 'r') as file:
    colnames = file.readline().strip().split(',')
    
    matrix = []
    for line in file:
      vect = line.strip().split(',')
      matrix.append(vect)
  
  return (colnames, matrix)



def transpose_matrix (matrix):
  "Transpose a matrix so that it's stored by columns"
  nrow = len(matrix)
  ncol = len(matrix[0])

  return [[matrix[i][j] for i in range(nrow)] for j in range(ncol)]



def count_missing (vect):
  """Count the number of missing values in a vector; 
missing values assumed to be 'NA'."""
  return vect.count('NA')



def count_notmissing (vect):
  """Count the number of non-missing values in a vector;
missing values assumed to be 'NA'."""
  return len(vect) - count_missing(vect)



def strip_NA (vect):
  "Strip 'NA' values from a vector and convert to floats"
  return [float(val) for val in vect if val != "NA"]



def mean (vect):
  "Calculate the mean of a vector; missing values assumed to be 'NA'."
  v = strip_NA(vect)
  n = len(v)
  if n == 0:
    return None

  sum = 0.0
  for val in v:
    sum += float(val)

  return sum/float(n)



def median (vect):
  "Calculate the median of a vector; missing values assumed to be 'NA'."
  # sort and strip NAs
  v = sorted(strip_NA(vect))

  n = len(v)
  if n==0:
    return None
    
  # odd number of items
  if n % 2:
    return v[(n-1)//2] # // is "integer division" (avoids error in python3)
  
  # even number of items
  return (v[n//2] + v[n//2-1])/2.0
  


def sd (vect):
  "Calculate the SD of a vector; missing values assumed to be 'NA'."
  # strip NAs
  v = strip_NA(vect)
  
  n = len(v)
  if n<2:
    return None
    
  mu = mean(v)
  ssq = 0.0
  for val in v:
    ssq += (val - mu)**2

  return math.sqrt(ssq/float(n-1))
  
  

if __name__ == '__main__':
  file = "data.csv"
  colnames, mat = read_csv(file)
  tmat = transpose_matrix(mat)

  # print results
  print("    %6s %3s %7s %7s %7s" % ("column", "n", "mean", "median", "SD"))
  for i in range(len(tmat)):
    col = tmat[i]
    print("    %6s %3d %7.3f %7.3f %7.3f" % (colnames[i], count_notmissing(col), mean(col), median(col), sd(col)))
