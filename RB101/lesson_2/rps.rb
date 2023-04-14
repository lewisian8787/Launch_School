require 'yaml'

MESSAGES = YAML.load_file("rps_messages.yml")

VALID_CHOICES = {
  'rock' => ['rock', 'r', 'ROCK', 'R'],
  'paper' => ['paper', 'p', 'PAPER', 'P'],
  'scissors' => ['scissors', 's', 'SCISSORS', 'S'],
  'lizard' => ['lizard', 'l', 'LIZARD', 'L'],
  'spock' => ['spock', 'sp', 'SPOCK', 'SP']
}

OUTCOMES = {
  'rock' => { 'rock' => "It's a tie!", 'paper' => "You lost!",
              'spock' => "You lost!", 'scissors' => "You won!",
              'lizard' => "You won!" },
  'paper' => { 'paper' => "It's a tie!", 'scissors' => "You lost!",
               'lizard' => "You lost!", 'rock' => "You won!",
               'spock' => "You won!" },
  'scissors' => { 'scissors' => "It's a tie!", 'rock' => "You lost!",
                  'spock' => "You lost!", 'paper' => "You won!",
                  'lizard' => "You won!" },
  'lizard' => { 'lizard' => "It's a tie!", 'rock' => "You lost!",
                'scissors' => "You lost!", 'spock' => "You won!",
                'paper' => "You won!" },
  'spock' => { 'spock' => "It's a tie!", 'lizard' => "You lost!",
               'paper' => "You lost!", 'scissors' => "You won!",
               'rock' => "You won!" }
}

def prompt(message)
  puts "=> #{message}"
end

def welcome_and_ready?
  loop do
    prompt(MESSAGES["welcome_message"])
    break unless gets.chomp.downcase.include?('n')
  end
end

def display_game_choices(user_choice, computer_choice)
  system "clear"
  prompt("You chose #{user_choice}, computer chose #{computer_choice}.")
end

def prompt_user_choice
  user_choice = ''
  loop do
    prompt(MESSAGES["user_choices"])
    user_choice = gets.chomp.downcase
    break if VALID_CHOICES.keys.include?(user_choice) ||
             VALID_CHOICES.values.flatten.include?(user_choice)
    prompt(MESSAGES["invalid_choice"])
  end
  VALID_CHOICES.keys.each do |key|
    if VALID_CHOICES[key].include?(user_choice)
      user_choice = key
      break
    end
  end
  user_choice
end

def calculate_computer_choice
  VALID_CHOICES.keys.sample
end

def display_winner(user_choice, computer_choice)
  puts OUTCOMES[user_choice][computer_choice]
end

def calculate_user_score(display_winner)
  display_winner.include?('won') ? 1 : 0
end

def calc_computer_score(display_winner)
  display_winner.include?('lost') ? 1 : 0
end

def display_score(user_score, computer_score)
  prompt("Your score is #{user_score}. Computer's score is #{computer_score}.")
end

def end_game_message(user_score)
  if user_score == 3
    prompt(MESSAGES['end_win_message'])
  else
    prompt(MESSAGES['end_loss_message'])
  end
end

def play_again?
  prompt(MESSAGES["play_again"])
  user_retry_response = gets.chomp
  user_retry_response.downcase.start_with?('y')
end

# start of main code

user_score = 0
computer_score = 0

loop do
welcome_and_ready?()
system "clear"
  loop do
    user_choice = prompt_user_choice()

    computer_choice = calculate_computer_choice()

    display_game_choices(user_choice, computer_choice)

    display_winner(user_choice, computer_choice)

    user_score += calculate_user_score(OUTCOMES[user_choice][computer_choice])
    computer_score += calc_computer_score(OUTCOMES[user_choice][computer_choice])

    display_score(user_score, computer_score)

    break if user_score == 3 || computer_score == 3
  end
  end_game_message(user_score)

  break unless play_again?()
end

# end of code
