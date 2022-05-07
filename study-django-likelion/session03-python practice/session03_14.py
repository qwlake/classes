# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:30:52 2019

@author: JungWoo
"""

#14. Given a list of numbers, count a number of pairs of equal elements. Any two elements that are equal to each other should be counted exactly once.
#
#- Example input1: 1 2 3 2 3
#- Example output1: 2
#- Example input2: 1 1 1 1 1
#- Example output2: 10
#
#count, x = 0, [int(i) for i in input().split()]
#while len(x) > 0:
#    y = x.pop()
#    for i in x:
#        count = count+1 if y == i else count
#print(count)