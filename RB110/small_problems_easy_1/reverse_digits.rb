#Reverse the Digits in a Number
#Write a method that takes a positive integer as an argument and returns that number with its digits reversed.

#Input positive integer
#Output same object with reversed digits
#Examples
#reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # No leading zeros in return value!
# reversed_number(12003) == 30021
# reversed_number(1) == 1
#Rules 
#Must be the same object
#Must be reversed integers
#Zeros to not be included
#Algorothm 
#Define a method, 'reverse_number', that takes one parameter expected to be an integer
  #invoke .reverse on the return value of calling .to_s on the argument integer.
  #invoke .to_i on the current return value of the argument
#End the method

def reversed_number(int)
  reverse = int.to_s.reverse.to_i
  reverse
end


p reversed_number(12345) == 54321
p reversed_number(12213) == 31221
p reversed_number(456) == 654
p reversed_number(12000) == 21 # No leading zeros in return value!
p reversed_number(12003) == 30021
p reversed_number(1) == 1