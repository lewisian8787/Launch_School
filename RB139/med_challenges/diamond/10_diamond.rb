#PEDAC
#appears to always be a valid input. 
#first row always contains 'A' (count 1)
#final row always contains 'A' (count 1)
#except first and last, all rows to have exactly two letters
#letters form a diamond shape
#passed in argument is the middle point
    #all letters prior to argument are ascending
    #all letters preceding argument are descending
#width of overall shape is equal to height of overall shape (including empty space)

#Algo
#create diamond class, no constructor
#create make_diamond instance method that takes an argument and sets an instance variable
#return just :A' if input is 'A'
#length and width is the index of the arg. (in alphabet) x2 + 1
#store before and after spaces as a vraiable which is above equation halved
#create retunr string to contain 'A' WITH ABOVE VARIABLE EITHER SIDE and newline char
#initialize 'middle spaces' counter to 1

#loop
#decrease after spaces counter by 1



class Diamond
    attr_reader :letter
    
    def initialize(lett)
        @letter = lett
    end
    
    def self.make_diamond(letter)
        Diamond.new(letter).shape
    end
    
    def shape
        return "A\n" if @letter == 'A'
        
        output = []
        
        range = ('A'.. letter).to_a + ("A"...letter).to_a.reverse
        range.each do |letter|
        end
            
    end
    
    def make_row
        case letter
            when "A"
            "A"
            when "B"
        end
            
    end
    
    def spaces_between_letters
        counter = 3
        
        case letter
            when "A"
                ""
            when "B"
                " "
        end
        
        ('A'..letter).each do |iteration|
            if iteration == "A"
                ""
            elsif iteration == "B"
                " "
            elsif iteration 0- 
                    
        
    end
    
    
    def calculate_diamond_width
        return 1 if letter == "A"
        counter = 1
        ("B"..letter).each do |range_letter|
            counter += 2
        end
        counter
    end
    
end

puts Diamond.make_diamond("A")