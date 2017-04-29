# =/=/=/=/=/=/=/=/=/=/
# C O D E  G O L F
# =/=/=/=/=/=/=/=/=/=/

#!/usr/bin/env python

import re, sys, collections

stops = open('../Documentos/stop_words.txt').read().split(',')

words = re.findall('[a-z]{2,}', open(sys.argv[1]).read().lower())

counts = collections.Counter(w for w in words if w not in stops)

for (w, c) in counts.most_common(25):
 print (w, '-', c)
