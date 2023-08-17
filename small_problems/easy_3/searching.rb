# Write a program that solicits 6 numbers from the user, then prints
# a message that describes whether or not the 6th number appears
# amongst the first 5 numbers.

def prompt(msg)
  puts "==> #{msg}"
end

array = []

prompt "Enter the 1st number:"
array[0] = gets.chomp.to_i
prompt "Enter the 2nd number:"
array[1] = gets.chomp.to_i
prompt "Enter the 3rd number:"
array[2] = gets.chomp.to_i
prompt "Enter the 4th number:"
array[3] = gets.chomp.to_i
prompt "Enter the 5th number:"
array[4] = gets.chomp.to_i
prompt "Enter the 6th number:"
number = gets.chomp.to_i

if array.include?(number)
    prompt "The number #{number} appears in #{array}"
else
    prompt "The number #{number} does not appear in #{array}."
end








# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 17
# The number 17 appears in [25, 15, 20, 17, 23].


# ==> Enter the 1st number:
# 25
# ==> Enter the 2nd number:
# 15
# ==> Enter the 3rd number:
# 20
# ==> Enter the 4th number:
# 17
# ==> Enter the 5th number:
# 23
# ==> Enter the last number:
# 18
# The number 18 does not appear in [25, 15, 20, 17, 23].