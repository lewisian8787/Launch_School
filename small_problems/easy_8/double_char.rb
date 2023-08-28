# Write a method that takes a string, and returns a new string in which every character is doubled.

=begin
input -string
output - new string
algorithm
define a method that takes a single string argument
initialize a new string and set to nil
  iterate through each character of the argument
    for each character append to empty array character * 2
  end iteration
  return the new string
end the method
=end

def repeater(str)
  new_string = ''
  str.each_char { |el| new_string << (el * 2) }
  new_string
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''