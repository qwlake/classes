# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:30:28 2019

@author: JungWoo
"""

#12. Fibonacci index 
#Fibonacci numbers are the numbers in the integer sequence starting with 1, 1 where every number after the first two is the sum of the two preceding ones:
#
#1, 1, 2, 3, 5, 8, 13, 21, 34, ...
#
#Given a positive integer, determine if it's the nth Fibonacci number for some n. If it is, print such n, otherwise print -1.
#
#- Example input: 8
#- Example output: 6
#
x, y, z, c  = int(input()), 0, 1, 1
while z != x:
    y, z, c = z, (y+z), c+1
print(c)