#!/usr/bin/env python
#
# Other code from the lecture slides

# converting between types
n = 5
type(n)

s = str(n)
x = float(n)

"%s %s %s" % (n, s, x)
"%d %d %d" % (n, int(s), x)
"%.2f %.2f %.2f" % (n, float(s), x)

dir(s)
dir(x)

s = "blah"
len(s)
s[2:]
s[:-1]

for ch in s:
  print(ch)


# matrix as a list of lists
x = [ [1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12] ]

x[1][3]


# for loops
vec = range(4)
for x in vec:
  print( (x+1)**2 )

import math
for i in xrange(len(vec)):
  print( math.log( vec[i] + 1 ) )


h = {'x':3, 'y':4, 'z':2}
for k in h:
  print( k, h[k] )

for k in sorted(h.keys()):
  print( k, h[k] )

for k,v in h.iteritems():
  print( k, v )

for v in h.itervalues():
  print( v )


# list comprehensions
vec = range(10)
[v**2 for v in vec if v > 5]

h = {'x':3, 'y':4, 'zz':2}
[h[k]**2 for k in h]
[h[k]**2 for k in h if len(k) == 1]
[[k, v**3] for k,v in h.iteritems()]
dict( [[k, v**3] for k,v in h.iteritems()] )

x = [k+1 for k in range(6)]
y = [True, False, True, False, False, False]
[x[i] for i in range(len(x)) if y[i]]

# more on strings
x = "bread and jam"
y = x.split(" ")
z = " ".join(y)

dir(x)
# help(x.index) #<- causes process to suspend

x.endswith("jam")
x.startswith("bre")
x.count("a")
x.find("and")
x.find("jelly")
x.index("and")
# x.index("jelly") #<- this gives an error

x.replace("jam", "jelly")

x.capitalize()
x.title()
x.upper()
x.upper().lower()

# regular expressions
import re

x = "Bread and Jam"
re.findall(r'[A-Z]', x)
re.split(r'[A-Z]', x)
re.sub(r'[A-Z]', '', x)

ph = "555-12-3456"
re.findall(r'-', ph)
re.findall(r'\d+', ph)
re.split(r'\D', ph)
re.sub(r'\D', '', ph)
