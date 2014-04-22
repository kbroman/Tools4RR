# Test one of the functions in convert3.py
#
# At the command line, type "nosetests nosetest_convert3.py"

from nose.tools import assert_equal
from convert3 import *

def test_parse_genotype():
  assert_equal(parse_genotype("       "),   "0 0")
  assert_equal(parse_genotype("100/98 "),   "100 98")
  assert_equal(parse_genotype("90/96  "),   "90 96")
  assert_equal(parse_genotype("90/ 96  "),  "90 96")
  assert_equal(parse_genotype("  3 / 8  "), "3 8")
