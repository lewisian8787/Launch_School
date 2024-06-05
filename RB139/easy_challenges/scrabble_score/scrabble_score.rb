LETTER_VALUES = {
  'A' => 1, 'E' => 1, 'I' => 1, 'O' => 1, 'U' => 1, 'L' => 1, 'N' => 1, 'R' => 1, 'S' => 1, 'T' => 1,
  'D' => 2, 'G' => 2,
  'B' => 3, 'C' => 3, 'M' => 3, 'P' => 3,
  'F' => 4, 'H' => 4, 'V' => 4, 'W' => 4, 'Y' => 4,
  'K' => 5,
  'J' => 8, 'X' => 8,
  'Q' => 10, 'Z' => 10
}

class Scrabble 
  attr_reader :word_score

  def initialize(word)
      @word = word
      @word_score = 0 
  end
  
  def score
     return 0 if @word.nil?

     @word.each_char do |char|
         if LETTER_VALUES.keys.include?(char.upcase)
          #binding.pry
           @word_score += LETTER_VALUES[char.upcase]
         else
           next
         end
     end
     @word_score
  end
  
  def self.score(word_arg)
      Scrabble.new(word_arg).score
  end
      

end