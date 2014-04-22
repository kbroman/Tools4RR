#!/usr/bin/env python3
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
for i in range(len(vec)):
  print( math.log( vec[i] + 1 ) )


h = {'x':3, 'y':4, 'z':2}
for k in h:
  print( k, h[k] )

for k in sorted(h.keys()):
  print( k, h[k] )

for k,v in h.items():
  print( k, v )

for v in h.values():
  print( v )


# list comprehensions
vec = range(10)
[v**2 for v in vec if v > 5]

h = {'x':3, 'y':4, 'zz':2}
[h[k]**2 for k in h]
[h[k]**2 for k in h if len(k) == 1]
[[k, v**3] for k,v in h.items()]
dict( [[k, v**3] for k,v in h.items()] )

x = [k+1 for k in range(6)]
y = [True, False, True, False, False, False]
[x[i] for i in range(len(x)) if y[i]]
