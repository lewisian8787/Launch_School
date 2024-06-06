class SumOfMultiples
  def initialize(*numbers)
      @numbers = numbers.empty? ? [3, 5] : numbers
  end 

  def to(target)
    output = []
    @numbers.each do |divisor|
      (1...target).each do |natural_number|
        output << natural_number if natural_number % divisor == 0 && !output.include?(natural_number)
      end
    end
    output.sum
  end
  
  def self.to(arg)
    SumOfMultiples.new.to(arg)
  end
    
end 