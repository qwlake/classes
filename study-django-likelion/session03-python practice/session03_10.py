# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:29:56 2019

@author: JungWoo
"""

#10. Given a string that may contain a letter f. Print the index of the first and last occurrence of f. If the letter f occurs only once, then output its index once. If the letter f does not occur, print -1.
#
#- Example input1: comfort
#- Example output1: 3
#- Example input2:  office
#- Example output2: 1 2
#
#- Example input3: hello
#- Example output3: -1
#
x = str(input())
y = ""
if x.count("f") > 1:
    y += str(x.rfind("f"))
y = str(x.find("f")) + " " + y
print(y)