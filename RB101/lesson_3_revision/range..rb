puts "enter a number between 0 and 100"
range1 = 0..50
range2 = 51..100
number = gets.chomp.to_i

if range1.include?(number)
  puts "The number is between 0 and 50"
elsif range2.include?(number)
  puts "The number is between 51 and 100"
else
  puts "The number is over 100"
end


