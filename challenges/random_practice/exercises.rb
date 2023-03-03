words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

def check(words)
    words.each do | word |
        if word.downcase.include?("lab")
            puts word
        else 
            puts "No match"
        end
    end
end

check(words)

def execute(&block)
    block.call
  end
  
  execute { puts "Hello from inside the execute method!" }
