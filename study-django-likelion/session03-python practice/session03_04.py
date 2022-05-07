# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:28:01 2019

@author: JungWoo
"""

#4. Write a program that solves a linear equation ax = b in integers. Given two integers a and b (a may be zero), 
#print a single integer root if it exists and print "no solution" or "many solutions" otherwise.
#
#- Example input 1: 1 -2 Example output 1:  -2
#- Example input 2: 2 -1 Example output 2: no solution
#
a, b = input().split()
a, b = int(a), int(b)
p = "many solutions" if (a, b) == (0, 0) else "no solution" if a == 0 else int(b / a) if b % a == 0 else "no solution"
print(p)