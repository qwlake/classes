# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:30:40 2019

@author: JungWoo
"""

#13.(Lists) Given a list of numbers, find and print the elements that appear in it only once. Such elements should be printed in the order in which they occur in the original list.
#
#- Example input: 4 3 5 2 5 1 3 5
#- Example output: 4 2 1
#
x = input().split()
s = sorted(set(x), reverse=True)
for i in s:
    if 1 == x.count(i):
        print(i, end=" ")