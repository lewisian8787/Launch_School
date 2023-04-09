VALID_CHOICES = ['rock', 'paper', 'scissors']

def prompt(message)
  puts("=> #{message}")
end

loop do
user_choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    user_choice = gets.chomp

    if VALID_CHOICES.include?(user_choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts ("You chose #{user_choice}, computer chose #{computer_choice}.")

  if (user_choice == 'rock' && computer_choice == 'scissors') ||
      (user_choice == 'paper' && computer_choice == 'rock') ||
      (user_choice == 'scissors' && computer_choice == 'paper')
    prompt("You won!")
  elsif (user_choice == 'rock' && computer_choice == 'paper') ||
        (user_choice == 'paper' && computer_choice == 'scissors') || 
          (user_choice == 'scissors' && computer_choice == 'rock')
    prompt("You lost!")
  else
    prompt("It's a tie!")
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end



