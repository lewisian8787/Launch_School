# Write a method that returns the next to last word in the String 
# passed to it as an argument.

# Words are any sequence of non-blank characters.

# You may assume that the input String will always contain at least 
# two words.

def penultimate(words)
  words_array = words.split
  words_array[-2]
end

penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'