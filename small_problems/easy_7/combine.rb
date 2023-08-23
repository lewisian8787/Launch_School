# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

=begin
input = 2 arrays
output = a new Array

algorithm

initialize new Array

iterate through array 1 with each_with_index
  for each iteration, append array_1[index] to new array, amnd append array_2[index] to new Array

    until array_2 is empty, append the return value of array_1.pop aND array_2.pop to new Array

return new array

=end

def interleave(arr1, arr2)
  new_array = []
  until arr2.empty? && arr1.empty?
    new_array << arr1.shift << arr2.shift
  end
    new_array
end

p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']