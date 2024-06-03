class Anagram 
  def initialize(word)
      @word = word
  end 
  
  def match(array_of_strings)
      output = []
      array_of_strings.each do |string|
        #binding.pry
          output << string if string.downcase.split('').sort.join == @word.downcase.split('').sort.join && string.downcase != @word.downcase
      end
      output
  end
end 