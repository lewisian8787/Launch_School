# Given the following data structure, return a new array containing the same sub-arrays as the 
# original but ordered logically by only taking into consideration the odd numbers they contain.

# arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

# # The sorted array should look like this:

# [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]

#Input A two-level nested array
#Output A two level nested array with the odd numbers sorted 'logically'
#Rules Must be the same strucutre, an array of 4 sub-arrays. Must be a new object. Sub arrays ordered according to odd numbers (5 comes before 7)
#Test Cases == [[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]]
#Algorithm
#Utilize map method to returna new array. 
#Initialize a new local variable and assign to the return value of calling the map method on the arr collection.
#Pass a block to the method and declare one block parameter to represent each sub-array.
#Utilize comparison on the sub arrays

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

final = arr.sort_by do |sub_array|
  sub_array.select do |num|
    num.odd?
  end 
end 
 
p final