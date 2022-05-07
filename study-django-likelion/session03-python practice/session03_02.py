# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:27:12 2019

@author: JungWoo
"""

#2. N students take K apples and distribute them among each other evenly. The remaining (the indivisible) part remains in the basket. 
#How many apples will each single student get? How many apples will remain in the basket?
#The program reads the numbers N and K. It should print the two answers for the questions above.
#
#- Example input: 6 
#		  50
#- Example output: 8
#		   2
#
x, y = input().split()
x, y = int(x), int(y)
print(y // x, y % x)