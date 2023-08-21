# Write a method that takes a string argument, and returns true if all of 
# the alphabetic characters inside the string are uppercase, false 
# otherwise. Characters that are not alphabetic should be ignored.

=begin
Algorithm 
define a method
  within strip the str of non alphabetic characters
  set new variable that is string rep of argument with upcase
  evaluate against original string
end
=end

def uppercase?(str)
  str.delete!("^a-zA-Z")
  new_string = str.upcase
  str == new_string
end



p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true
