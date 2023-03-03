puts "Put in a number"
a = gets.chomp.to_i

if a == 3
    puts "a = 3"
end
#elsif a == 4
    #puts "a = 4"
#else
    #puts "a is neither 3, nor 4"
puts "a is NOT 3" unless a == 3
