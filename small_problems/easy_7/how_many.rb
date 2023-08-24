# Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

# expected output

# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

=begin 
input - Array
output - Hash

algorithm
define a method that takes an array Argument
  initialize a hash with 4 key value pairs set to 0
    iterate through array
    incremenet hash key by 1

=end

def count_occurrences(array)
  hash = Hash.new(0)
  array.each do |el|
    hash[el] += 1
  end

  hash.each do |key, value|
    puts "#{key} => #{value}"
  end
end
  

count_occurrences(vehicles)
#count_occurrences(["car", "ATV", 'truck', "bicycle", "bicycle", 'SUV', "car", 'truck'])