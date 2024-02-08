# Find all pairs
# You are given array of integers, your task will be to count all pairs in that array and return their count.
# Notes:
# Array can be empty or contain only one value; in this case return 0
# If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs
# of 0s)
# Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
# Examples
# [1, 2, 5, 6, 5, 2] --> 2
# ...because there are 2 pairs: 2 and 5
# [1, 2, 2, 20, 6, 20, 2, 6, 2] --> 4
# ...because there are 4 pairs: 2, 20, 6 and 2 (again)

=begin

Problem
Input: Array
Return: An integer representing the amount of pairs in the given array. 
Rules
3 of an integer would return 2, the thirs is not counted.
Each pair of 2 numbers returns 1. 
Empty array or a one element array returns 0. 

Examples
p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0

Data Structures
Array
Hash
Integer

Algorithm
High-Level:
Iterate over the given argument array.
Return 0 if empty or one element. 
Create a hash that counts occurences of individual numbers in input argument. 
Iterate over hash and increment a counter by 1 each time value is dividable by 2. 

Step-by-Step:
- Define a method that takes a single array argument. 
- Initialize an empty hash with default values of 0. 
- Iterate over the input argument array. 
  - Increment the value of each hash k/v based on number occurences. 
- Initialize a return variable to 0.
- Iterate over the hash.
  - Divide value by 2 and add number to return variable. 
  - Add and reassign each time. 
- Return variable. 
- End method. 

Code
=end

def pairs(array)
  return 0 if array.empty? || array.length < 2
  count_hash = Hash.new(0)
  array.each do |el|
    count_hash[el] += 1
  end
  return_variable = 0
  count_hash.each {|k,v| return_variable += (v/2)}
  return_variable
end

p pairs([1, 2, 5, 6, 5, 2]) == 2
p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4
p pairs([0, 0, 0, 0, 0, 0, 0]) == 3
p pairs([1000, 1000]) == 1
p pairs([]) == 0
p pairs([54]) == 0