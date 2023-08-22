# Write a method that takes an Array as an argument, and returns two 
# Arrays (as a pair of nested Arrays) that contain the first half and 
# second half of the original Array, respectively. If the original array 
# contains an odd number of elements, the middle element should be placed 
# in the first half Array.

=begin
input - array
output - nested array (2 elements)
algorithm 
initialize new array
initialize second new array
iterate over original array destructively
  assign first element to first new array
  assign second element to second new array
end iteration
initialize new array that has both new arrays nested within

=end

def halvsies(array)
  middle = (array.size / 2.0).ceil
  first_half = array.slice(0, middle)
  second_half = array.slice(middle, array.size - middle)
  [first_half, second_half]
end

p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]