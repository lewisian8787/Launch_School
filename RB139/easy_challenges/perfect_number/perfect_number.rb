require 'prime'

class PerfectNumber
    def initialize(entry_number)
        @entry_number = entry_number
    end
    
    def classify
        raise StandardError if @entry_number < 1 
        return 'deficient' if @entry_number.prime?
        
        divisors = (1...@entry_number).select {|num|@entry_number % num == 0}
        
        if divisors.sum == @entry_number 
            'perfect'
        else
            'abundant'
        end
    end
    
    def self.classify(number) 
        PerfectNumber.new(number).classify
    end
    
end 