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

  # create empty matrix
  x = [[None for col in range(ncol)] for row in range(nrow)]

  # fill with Gaussian deviates
  for i in range(nrow):
    for j in range(ncol):
      x[i][j] = random.gauss(colmean[j], colsd[j])

  return x


def make_some_missing (matrix, nmis_per_col):
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

def matrix_to_str(matrix):
  return [[str(val) for val in row] for row in matrix]

def write_matrix_as_csv(matrix, filename):
  with open(filename, "w") as file:
    header = ["V" + str(col) for col in range(len(matrix[0]))]
    file.write(",".join(header) + "\n")
    
    for row in range(len(matrix)):
      file.write(",".join(matrix[row]) + "\n")


if __name__ == '__main__':
  random.seed(86061812)
  x = random_matrix(100, [1.0, 3.0, 5.0, 7.0, 9.0], [0.5, 1.0, 1.5, 2.0, 2.5])
  make_some_missing(x, [5, 10, 15, 20, 25])
  x = matrix_to_str(x)
  write_matrix_as_csv(x, "data.csv")
