# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:31:11 2019

@author: JungWoo
"""

#15. (Dicts) The text is given in a single line. For each word of the text count the number of its occurrences before it.
#
#- Example input : one two one two three two four three
#- Example output: 0 0 1 1 0 2 0 1
#
#x, y = input().split(), {}
#for i in x:
#    y[i] = y[i] + 1 if i in y.keys() else 0
#    print(y[i], end = " ")