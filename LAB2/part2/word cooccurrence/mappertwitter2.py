#!/usr/bin/env python
"""mapper.py"""

import sys
top_words = ['cricket','world','cup','twenty','squad','run','match','team','game','australia']
# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    words = line.split()
    # increase counters
    for word in words:
        # write the results to STDOUT (standard output);
        # what we output here will be the input for the
        # Reduce step, i.e. the input for reducer.py
        #
        # tab-delimited; the trivial word count is 1
        #print '%s\t%s' % (word, 1)
        
        for x in list(range(0,len(words)-1)):
            for i in list(range(x,x+2)):
                if words[x] != words[i] and words[x] in top_words:
                    print '%s\t%s' % (str(words[x]+','+words[i]), 1)       
        