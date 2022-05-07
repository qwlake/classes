# -*- coding: utf-8 -*-
"""
Created on Wed Apr  3 16:02:27 2019

@author: JungWoo
"""

#1.Write a program that reads an integer number and prints its previous and next numbers. See the example below.
#
#- Example input: 179
#- Example output:
# The next number for the number 179 is 180
# The previous number for the number 179 is 178
#
x = int(input())
print("The next number for the number", x, "is", x+1)
print("The previous number for the number", x, "is", x-1)
