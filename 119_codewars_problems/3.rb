
def wave(string)
  output = []
  new_string = string
  new_string.delete!(' ')
  counter = 0
  loop do 
    break if counter == new_string.length
    working_str = ''
    string.chars.each_with_index do |char, index|
      if ('a'..'z').include?(char) && index == counter
        working_str << char.upcase
      elsif ('a'..'z').include?(char) && index != counter
        working_str << char
      else 
        working_str << char
      end
    end
    output << working_str
    counter += 1
  end
  p output
end

# p wave("hello") == ["Hello", "hEllo", "heLlo", "helLo", "hellO"]
# p wave("codewars") == ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs",
# "codewarS"]
# p wave("") == []
# p wave("two words") == ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs",
# "two wordS"]
p wave(" gap ") == [" Gap ", " gAp ", " gaP "]