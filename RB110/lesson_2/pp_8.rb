#Using the each method, write some code to output all of the vowels from the strings.
#input a hash that includes nested arrays
#output a string of each word that includes just the vowels
#test cases
#rules no consonants must be output
#algorithm

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each do |key, value|
  value.each do |el|
    character = el.chars
    character.each do |char|
    if char == 'a'
      puts char
      elsif char == 'e'
      puts char
      elsif char == 'i'
      puts char
      elsif char == 'o'
      puts char
      elsif char == 'u'
      puts char
    else
      next
    end
    end
  end
end
