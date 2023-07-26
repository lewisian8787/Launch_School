# Given this data structure write some code to return an array which contains only the hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

#Input: An array of hashes containing nested arrays.
#Output: Array containing hashes
#Rules: The returned nested arrays must only contain even numbers. 
#An array must be returned. 
#Test Cases:
#Algorithm:Iterate over the array using map as this will return a new array. 
#Utilize an if conditional
#Iterate over the hashes using select setting two block parameters, key and value (the value represents the array of integers)
#Utilize 
