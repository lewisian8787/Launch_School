# Write a method that takes two Arrays as arguments, and returns an 
# Array that contains all of the values from the argument Arrays. 
# There should be no duplication of values in the returned Array, 
# even if there are duplicates in the original Arrays.

=begin
input - two arrays
output - an array
algorithm
create a method that takes two arguments, expected to be arrays
  declare a new array
    iterate over argument array passing in to new array
      if duplicate then delete element
    iterate over second array passing in to new array
      if duplicae then delete element
  return new array
=end

def merge(array_1, array_2)
  array_1 | array_2
end

p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]