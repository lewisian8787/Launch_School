require 'pry'

class GuessingGame

  attr_accessor :num_guesses, :user_response, :target_number

  def initialize
    @num_guesses = 7
    @user_response = 0
    @target_number = (1..100).to_a.sample
  end 

  def welcome_message
    puts ""
    puts "You have #{num_guesses} guesses remaining."
    puts "Enter a number between 1 and 100:"
  end

  def number_position
    return true if user_response == target_number
    binding.pry
    if user_response < target_number
      num_guesses -= 1
      puts "Your guess is too low..."
    elsif user_response > target_number
      puts "Your guess is too high..."
    end
    false
  end

  def play
    loop do
      welcome_message
      loop do
        user_response = gets.chomp.to_i
        break unless !(1..100).include?(user_response) 
        puts "Invalid guess. Enter a number between 1 and 100:"
      end
      @num_guesses -= 1
      number_position
      break if @num_guesses == 0 || number_position
    end
  end
end

game = GuessingGame.new
game.play
