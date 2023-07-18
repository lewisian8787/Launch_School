#Get Middle Character
#Write a method that takes a non-empty string argument, and returns the middle character or characters of the argument. 
#If the argument has an odd length, you should return exactly one character. 
#If the argument has an even length, you should return exactly two characters.

#Input a non-empty string
#Output the middle character or characters of the string
#Test Cases
# center_of('I love ruby') == 'e'
# center_of('Launch School') == ' '
# center_of('Launch') == 'un'
# center_of('Launchschool') == 'hs'
# center_of('x') == 'x'
#Rules 
# With an odd length, return ONE character
# With even length, return TWO characters
# Characters must be strings
# Must be from the middle of the argument
#Algorithm 
#define a method 'middle_char' that takes one argument 'str'
  #initialize a new variable 'str_length' that is set to the return value of calling .length on the str argument
  #declare an if statement evaluating if str.length is odd
    #if true is returned, set a new variable 'mid_letter' to the element referenced by str.length divided by 2.
    #output this mid_letter variable
  #declare an else statement
    #initialize a new variable 'mid_letters' to the return value of the range between str.length / 2 - 1 and str.length / 2
    #output this mid_letters variable
  #end the if/else
#end the method

def middle_char(str)
  str_length = str.length
  if str_length.odd?
    mid_letter = str[str.length / 2]
    # puts mid_letter
  else
    mid_letters = str[(str_length / 2 - 1)..        (str.length / 2)]
    # puts mid_letters
  end
end

p middle_char('I love ruby') == 'e'
p middle_char('Launch School') == ' '
p middle_char('Launch') == 'un'
p middle_char('Launchschool') == 'hs'
p middle_char('x') == 'x'