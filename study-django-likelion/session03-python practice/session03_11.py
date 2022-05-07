# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:30:16 2019

@author: JungWoo
"""

#11.(While) Fibonacci numbers
#Fibonacci numbers are the numbers in the integer sequence starting with 1, 1 where every number after the first two is the sum of the two preceding ones:
#
#1, 1, 2, 3, 5, 8, 13, 21, 34, ...
#
#Given a positive integer n, print the nth Fibonacci number.
#
#- Example input: 6
#- Example output: 8
#
x, y, z = int(input()), 0, 1
while x > 1:
    y, z, x = z, (y+z), x-1
print(z)