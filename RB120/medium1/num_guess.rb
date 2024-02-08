#require 'pry'


class GuessingGame

  attr_accessor :num_guesses, :user_response, :target_number
  attr_reader :low_num, :high_num, :size_of_range

  def initialize(low_num, high_num)
    @low_num = low_num
    @high_num = high_num
    @size_of_range = (high_num - low_num)
  end

  def clear
    system 'cls'
  end

  def welcome_message
      puts ""
      puts "Welcome to Mr. Lewis' number guessing game! You simply have to guess what number I am thinking of..."
      puts ""
        loop do
          puts "Are you ready to play? Type 'yes' if so."
          answer = gets.chomp
          break if answer == 'yes'.downcase
          puts "Sorry, that's an incorrect response. Please enter 'yes' if you are ready to play!"
        end
  end

  def number_position
    return true if user_response == target_number

    if user_response < target_number
      puts "Your guess is too low..."
      puts ""
      puts "You have #{num_guesses} guesses remaining."
    elsif user_response > target_number
      puts "Your guess is too high..."
      puts ""
      puts "You have #{num_guesses} guesses remaining."
    end

    false
  end

  def winning_message
    puts "Congratulations! You WON!"
  end
  
  def losing_message
    puts "Sorry! Better luck next time!"
    puts "The number was #{target_number}!"
  end

  def play
    @num_guesses = Math.log2(size_of_range).to_i + 1
    @user_response = nil
    @target_number = (low_num..high_num).to_a.sample
    welcome_message
    clear
    loop do
      puts "Enter a number between #{low_num} and #{high_num}."
      loop do
        @user_response = gets.chomp.to_i
        clear
        break if (low_num..high_num).include?(user_response) 
        puts "Invalid guess. Enter a number between #{low_num} and #{high_num}:"
      end

      @num_guesses -= 1
      break if num_guesses == 0 || number_position
    end

    user_response == target_number ? winning_message : losing_message
  end
end

game = GuessingGame.new(500, 1500)
game.play
