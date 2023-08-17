# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# Examples

# >> Please enter an integer greater than 0:
# 5
# >> Enter 's' to compute the sum, 'p' to compute the product.
# s
# The sum of the integers between 1 and 5 is 15.


# >> Please enter an integer greater than 0:
# 6
# >> Enter 's' to compute the sum, 'p' to compute the product.
# p
# The product of the integers between 1 and 6 is 720.

def compute(num)
  result = 0
  range = 1..num
    for number in range
    result += number
    end
  result
end

def product(num)
  result = 1
  range = 1..num
    for number in range
    result *= number
    end 
  result
end 

puts "Enter a number greater than 0"
user_entry = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
comp_task = gets.chomp 

case comp_task
when 'p'
  puts "The product of the integers between 1 and #{user_entry} is #{product(user_entry)}."
when 's'
  puts "The sum of the integers between 1 and #{user_entry} is #{compute(user_entry)}."
end

