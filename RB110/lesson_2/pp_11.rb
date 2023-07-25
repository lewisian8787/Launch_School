# Given the following data structure use a combination of methods, including either the select or reject method, 
# to return a new array identical in structure to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

# The returned array should have the following value:

[[], [3, 12], [9], [15]]

#Input: An array of nested arrays, all containing integers.
#Output: An array identical in structure, but only containing the integers that are multiple by 3.
#Rules: Same structure, i.e. four arrays nested within an outer array.
        # New object must be returned. 
        # Only integers that are divisable by 3 should be returned.
#Test Cases: Nil
#Algorithm:
#Initialize a new local variable, and assign it the return value of calling map on the arr array.
  #Within the call to map, initialize a block and allocate one block parameter, 'element'.
  #Call the select method on 'element', invoking another block and assigning one block parameter, 'num'.
  #The return of the select method should be based on num dividing by 3 being equal to 0, nothing else.
  #End the select method
  #End the map method

arr = [[2], [3, 5, 7, 12], [9], [11, 13, 15]]

new_array = arr.map do |element|
  element.select do |num|
    num % 3 == 0
  end 
end 

p arr
p new_array