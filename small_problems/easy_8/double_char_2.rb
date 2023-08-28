# Write a method that takes a string, and returns a new string in which every consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

=begin
input - string
output - new String
algorithm
define a method that takes one argument exp to be a String
  initialize a new string
    iterate through each character
        if character is consonant, then 
          twice append character to new String
        else next
        end conditional
    end iteration
  return new String
end method
=end

VOWELS = %w[a e i o u]

def is_consonant(str)
  str.downcase.match?(/[a-z]/) && !VOWELS.include?(str.downcase)
end

def double_consonants(str)
  new_string = ''
  vowels = ['a', 'e', 'i', 'o', 'u']
    str.each_char do |el|
      if is_consonant(el)
        new_string << el << el
      else new_string << el
      end
    end
  new_string
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""