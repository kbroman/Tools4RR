#!/usr/bin/env python3
# Test one of the functions in convert3.py
#
# on the command line, type "test_convert3.py"

import unittest
from convert3 import *

class check_parse_genotype(unittest.TestCase):
  def test_parse_genotype(self):
    self.assertEqual(parse_genotype("       "), "0 0")
    self.assertEqual(parse_genotype("100/98 "), "100 98")
    self.assertEqual(parse_genotype("90/96  "), "90 96")
    self.assertEqual(parse_genotype("90/ 96  "), "90 96")
    self.assertEqual(parse_genotype("  3 / 8  "), "3 8")

if __name__ == '__main__':
  unittest.main()
