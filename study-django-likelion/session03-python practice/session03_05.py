# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:28:24 2019

@author: JungWoo
"""

#5.(For) Given two integers A and B (A ≤ B). Print all numbers from A to B inclusively.
#
#- Example input: 1 10 
#- Example output: 1 2 3 4 5 6 7 8 9 10
#
x, y = input().split()
x, y = int(x), int(y)
for i in range(x, y+1):
    print(i, end=" ")