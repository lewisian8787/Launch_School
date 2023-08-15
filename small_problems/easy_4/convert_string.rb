require 'pry'

def string_to_integer(str)
  
  integer_conversion = {'1' => 1, 
  '2' => 2,
  '3' => 3,
  '4' => 4, 
  '5' => 5,
  '6' => 6,
  '7' => 7, 
  '8' => 8,
  '9' => 9, 
  '0' => 0}

integer = 0

str.each_char do |char|
  index = str.index(char) + 1 #1 
  multi_factor = 10 ** (str.length - index) #3
  
  char = integer_conversion[char]

  integer += (char * multi_factor)
end
integer
end


p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
