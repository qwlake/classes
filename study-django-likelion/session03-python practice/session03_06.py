# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:28:47 2019

@author: JungWoo
"""

#6. For the given integer N calculate the following sum:
#1³ + 2³ + ... + N³
#
#- Example input: 3 Example output: 36
#
x = int(input())
y = 0
for i in range(1, x+1):
    y += i**3
print(y)