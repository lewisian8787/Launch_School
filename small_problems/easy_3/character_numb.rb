# Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters. Spaces should not be 
# counted as a character.

puts "Please write word or multiple words:"
user_answer = gets.chomp
character_number = user_answer.delete(' ').size
puts "There are #{character_number} characters in '#{user_answer}'."

