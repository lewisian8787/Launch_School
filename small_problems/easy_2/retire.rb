#Build a program that displays when the user will retire and how many years she has to work till retirement.

# What is your age? 30
# At what age would you like to retire? 70

# It's 2016. You will retire in 2056.
# You have only 40 years of work to go!

def retirement_calc(age, retire_age)
  time_to_retirement = (retire_age - age)
  time_to_retirement
end

puts "What is your age?"
person_age = gets.chomp.to_i

puts "At what age would you like to retire?"
retirement_target_age = gets.chomp.to_i

variable = retirement_calc(person_age, retirement_target_age)
variable2 = (Time.now.year + variable)

puts "It's #{Time.now.year}. You will retire in #{variable2}."
puts "You only have #{variable} years of work to go!"