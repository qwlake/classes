# -*- coding: utf-8 -*-
"""
Created on Sun Apr  7 10:29:04 2019

@author: JungWoo
"""

#7. There was a set of cards with numbers from 1 to N. One of the card is now lost. Determine the number on that lost card given the numbers for the remaining cards.
#Given a number N, followed by N − 1 integers representing the numbers on the remaining cards (distinct integers in the range from 1 to N). Find and print the number on the lost card.
#
#- Example input: 5 3 5 2 1  
#- Example output: 4
#
x = input().split()
n = int(x[0])
l1 = {str(i) for i in range(1, n+1)}
l2 = {i for i in x[1:]}
print(l1 - l2)