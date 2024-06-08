class Series
  def initialize(number)
      @number = number.split('').map(&:to_i)
  end 
  
  def slices(length)
      raise ArgumentError if length > @number.length
    self.generate_all_substrings.select {|sub|sub.length == length}
  end
  
  def generate_all_substrings
    all_substrings = []
      (0...@number.length).each do |outer_index|
          (0...@number.length).each do |inner_index|
            next if inner_index < outer_index
            substring = @number[outer_index..inner_index]
            all_substrings << substring
          end
      end
      all_substrings
  end
          
end