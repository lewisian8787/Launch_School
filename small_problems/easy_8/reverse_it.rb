# Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

=begin
input - a String
output - a new String
algorithm
define a method that takes one argument, expected to be a String
  one line - split string, perform reverse function on each string and join to return as one string
=end

def reverse_sentence(str)
  str.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''