# Write a method named include? that takes an Array and a search value as arguments. This method should return true if the search value is in the array, false if it is not. You may not use the Array#include? method in your solution.

=begin
input - an array and a search value
output - boolean
algorithm -
define a method that takes two arguements, exp to be an array and value to search for
  iterate thourgh the array 
    if element is equal to the search value return true
      if not move onto next iteration
        if no match is found return false 
        end the method 
=end

def include?(arr, obj)
  arr.each do |el|
    if el == obj
      return true
    end
  end
  false
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false