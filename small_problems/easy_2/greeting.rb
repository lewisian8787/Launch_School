# Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

def greeting(name)
  if name.end_with?('!')
    puts "HELLO #{name.upcase} WHY ARE WE SCREAMING?"
  else
    puts "Hello #{name}!"
  end
end

puts "What is your name?"
user_name = gets.chomp

greeting(user_name)