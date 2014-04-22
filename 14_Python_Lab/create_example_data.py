#!/usr/bin/env python
#
# generate a matrix of random data

import random


def random_matrix (nrow, colmean, colsd):
  """Generate a random matrix of independent Gaussians,
with nrow being the number of rows, and with colmean
and colsd being vectors of column means and SDs, respectively."""

  assert(len(colmean) == len(colsd))
  assert(nrow > 0)

  ncol = len(colmean)

  # generate data as matrix, using nested list comprehension
  x = [[random.gauss(colmean[col], colsd[col]) for col in range(ncol)] for row in range(nrow)]

  return x


def matrix_to_rounded_str(matrix):
  "Replace matrix values with strings rounded to 4 decimal places"
  return [[("%.4f" % val) for val in row] for row in matrix]

def make_some_missing (matrix, nmis_per_col):
  """Replace some matrix values with 'NA'; nmis_per_col is a single integer
or a vector integers, of length ncol(matrix)"""
  nrow = len(matrix)
  ncol = len(matrix[0])

  # if nmis_per_col is length 1, repeat to make length ncol
  if len(nmis_per_col) == 1:
    nmis_per_col = [nmis_per_col for i in range(ncol)]
  assert(len(nmis_per_col) == ncol)

  mis = [random.sample(range(nrow), nmis_per_col[col]) for col in range(ncol)]
  for j in range(len(mis)):
    for i in mis[j]:
      x[i][j] = "NA"

def write_matrix_as_csv(matrix, filename):
  "Write a matrix as a comma-delimited file"
  with open(filename, "w") as file:
    header = ["col" + str(col+1) for col in range(len(matrix[0]))]
    file.write(",".join(header) + "\n")
    
    for row in range(len(matrix)):
      file.write(",".join(matrix[row]) + "\n")


if __name__ == '__main__':
  random.seed(86061812)
  x = random_matrix(100, [1.0, 3.0, 5.0, 7.0, 9.0], [0.5, 1.0, 1.5, 2.0, 2.5])
  x = matrix_to_rounded_str(x)
  make_some_missing(x, [5, 10, 15, 20, 25])
  write_matrix_as_csv(x, "data.csv")
