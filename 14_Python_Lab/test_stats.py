#!/usr/bin/env python
# Unit tests for stats.py
#
# on the command line, type "test_stats.py"

import unittest, math
from stats import *

class check_transpose_matrix(unittest.TestCase):
  def test_transpose_matrix_int(self):
    x = [[1,2,3], [4,5,6], [7,8,9], [10,11,12]]
    tx = [[1,4,7,10], [2,5,8,11], [3,6,9,12]]

    self.assertEqual(transpose_matrix(x), tx)
    self.assertEqual(transpose_matrix(tx), x)

  def test_transpose_matrix_str(self):
    x = [['1','2','3'], ['4','5','6'], ['7','8','9'], ['10','11','12']]
    tx = [['1','4','7','10'], ['2','5','8','11'], ['3','6','9','12']]

    self.assertEqual(transpose_matrix(x), tx)
    self.assertEqual(transpose_matrix(tx), x)

  def test_transpose_matrix_float(self):
    x = [[0.1,0.2,0.3], [0.4,0.5,0.6], [0.7,0.8,0.9], [1.0,1.1,1.2]]
    tx = [[0.1,0.4,0.7,1.0], [0.2,0.5,0.8,1.1], [0.3,0.6,0.9,1.2]]

    self.assertAlmostEqual(transpose_matrix(x), tx)
    self.assertAlmostEqual(transpose_matrix(tx), x)


class check_strip_NA(unittest.TestCase):
  def test_strip_NA(self):
    self.assertEqual(strip_NA([1, 'NA', 2, 3, 'NA']), [1, 2, 3])
    self.assertEqual(strip_NA([1, 2, 3]), [1, 2, 3])
    self.assertAlmostEqual(strip_NA([1.0, 'NA', 2.0, 3.0, 'NA']), [1.0, 2.0, 3.0])
    self.assertAlmostEqual(strip_NA([1.0, 2.0, 3.0]), [1.0, 2.0, 3.0])
    self.assertEqual(strip_NA([]), [])
    self.assertEqual(strip_NA(['NA']), [])
    self.assertEqual(strip_NA(['NA', 'NA']), [])

class check_count_missing(unittest.TestCase):
  def test_count_missing(self):
    self.assertEqual(count_missing([1, 2, 3]), 0)
    self.assertEqual(count_missing([1, 2, 3, 'NA']), 1)
    self.assertEqual(count_missing(['NA', 1, 2, 3]), 1)
    self.assertEqual(count_missing(['NA', 1, 'NA', 2, 'NA', 3, 'NA']), 4)
    self.assertEqual(count_missing([1.0, 2.0, 3.0, '8.0', 9.0]), 0)
    self.assertEqual(count_missing([1.0, 2.0, 3.0, 'NA', '8.0', 9.0]), 1)
    self.assertEqual(count_missing(['NA', 1.0, 2.0, 3.0, '8.0', 9.0]), 1)
    self.assertEqual(count_missing(['NA', 1.0, 'NA', 2.0, 'NA', 3.0, 'NA', '8.0', 9.0]), 4)
    self.assertEqual(count_missing([]), 0)
    self.assertEqual(count_missing(['NA']), 1)
    self.assertEqual(count_missing(['NA', 'NA']), 2)

class check_count_notmissing(unittest.TestCase):
  def test_count_notmissing(self):
    self.assertEqual(count_notmissing([1, 2, 3]), 3)
    self.assertEqual(count_notmissing([1, 2, 3, 'NA']), 3)
    self.assertEqual(count_notmissing(['NA', 1, 2, 3]), 3)
    self.assertEqual(count_notmissing(['NA', 1, 'NA', 2, 'NA', 3, 'NA']), 3)
    self.assertEqual(count_notmissing([1.0, 2.0, 3.0, '8.0', 9.0]), 5)
    self.assertEqual(count_notmissing([1.0, 2.0, 3.0, 'NA', '8.0', 9.0]), 5)
    self.assertEqual(count_notmissing(['NA', 1.0, 2.0, 3.0, '8.0', 9.0]), 5)
    self.assertEqual(count_notmissing(['NA', 1.0, 'NA', 2.0, 'NA', 3.0, 'NA', '8.0', 9.0]), 5)
    self.assertEqual(count_notmissing([]), 0)
    self.assertEqual(count_notmissing(['NA']), 0)
    self.assertEqual(count_notmissing(['NA', 'NA']), 0)


class check_mean(unittest.TestCase):
  def test_mean(self):
    self.assertEqual(mean([]), None)
    self.assertEqual(mean(['NA']), None)
    self.assertEqual(mean(['NA', 'NA']), None)
    self.assertAlmostEqual(mean(['NA', 5.3, 'NA']), 5.3)
    self.assertAlmostEqual(mean(['NA', 1, 2, 'NA']), 1.5)
    self.assertAlmostEqual(mean(['NA', 1, 3.0, 'NA', 4.0, 2, 5.0]), 3.0)
    self.assertAlmostEqual(mean(['NA', 1, 3.0, 'NA', 4.0, 2, 10.0]), 4.0)



class check_median(unittest.TestCase):
  def test_median(self):
    self.assertEqual(median([]), None)
    self.assertEqual(median(['NA']), None)
    self.assertEqual(median(['NA', 'NA']), None)
    self.assertAlmostEqual(median(['NA', 5.3, 'NA']), 5.3)
    self.assertAlmostEqual(median(['NA', 1, 2, 'NA']), 1.5)
    self.assertAlmostEqual(median(['NA', 1, 3.0, 'NA', 4.0, 2, 5.0]), 3.0)
    self.assertAlmostEqual(median(['NA', 1, 3.0, 'NA', 4.0, 2, 10.0]), 3.0)




class check_sd(unittest.TestCase):
  def test_sd(self):
    self.assertEqual(sd([]), None)
    self.assertEqual(sd(['NA']), None)
    self.assertEqual(sd(['NA', 'NA']), None)
    self.assertEqual(sd(['NA', 5.3, 'NA']), None)
    self.assertAlmostEqual(sd(['NA', 1, 2, 'NA']), math.sqrt(2)/2)
    self.assertAlmostEqual(sd(['NA', 1, 3.0, 'NA', 4.0, 2, 5.0]), math.sqrt(2.5))
    self.assertAlmostEqual(sd(['NA', 1, 3.0, 'NA', 4.0, 2, 10.0]), math.sqrt(12.5))



if __name__ == '__main__':
  unittest.main()
