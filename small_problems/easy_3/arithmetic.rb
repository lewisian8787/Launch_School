#Write a program that prompts the user for two positive integers, and 
# then prints the results of the following operations on those two 
# numbers: addition, subtraction, product, quotient, remainder, and
#power. Do not worry about validating the input.

def prompt(msg)
  puts "==> #{msg}"
end

def addition(int, int2)
  int + int2
end

def subtraction(int, int2)
  int - int2
end

def product(int, int2)
  int * int2
end

def quotient(int, int2)
  int / int2
end

def remainder(int, int2)
  int % int2
end

def power(int, int2)
  int ** int2
end

prompt "Enter the first number:"
first_number = gets.chomp.to_i

prompt "Enter the second number:"
second_number = gets.chomp.to_i

prompt "#{first_number} + #{second_number} = #{addition(first_number, second_number)}"
prompt "#{first_number} - #{second_number} = #{subtraction(first_number, second_number)}"
prompt "#{first_number} * #{second_number} = #{product(first_number, second_number)}"
prompt "#{first_number} / #{second_number} = #{quotient(first_number, second_number)}"
prompt "#{first_number} % #{second_number} = #{remainder(first_number, second_number)}"
prompt "#{first_number} ** #{second_number} = #{power(first_number, second_number)}"


