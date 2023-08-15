
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_game(play_deck, pls_hand, com_hand)
  2.times do
    random_element = play_deck.delete_at(rand(play_deck.length))
    pls_hand << random_element
    
    random_element = play_deck.delete_at(rand(play_deck.length))
    com_hand << random_element
  end
end

def calculate_hand_value(hand)
  value = 0
  hand.each do |card| # C7, H2
    card.each do |el|    # C7
      if el == 'S' || el == "H" || el == "C" || el == "D"
        next
      elsif el == 'K' || el == 'Q' || el == 'J'
          value += 10
      elsif el == 'A'
        value += 11
      else
        value += el.to_i
      end
    end
    if value > 21 && card.include?('A')
      value -= 11
      value += 1
    end
  end
  value
end 

def display_players_hand(pls_hand, comp_hand)
  system 'clear'
  print "Players Hand: "
  pls_hand.length.times do |num|
    if (num + 1) == pls_hand.length
      print pls_hand[num][0]
      puts pls_hand[num][1]
    else
      print pls_hand[num][0]
      print pls_hand[num][1]
      print " "
    end
  end
  prompt "Player's Hand Value: #{calculate_hand_value(pls_hand)}"
  
  display_comp_starting_hand(comp_hand)
end

def display_computers_hand(comp_hand, pls_hand)
   system 'clear'
  
# Displays players hand
  print "Players Hand: "
    pls_hand.length.times do |num|
    if (num + 1) == pls_hand.length
      print pls_hand[num][0]
      puts pls_hand[num][1]
    else
      print pls_hand[num][0]
      print pls_hand[num][1]
      print " "
    end
  end
  prompt "Player's Hand Value: #{calculate_hand_value(pls_hand)}"
  
# displays computer hand
  print "Dealer's Hand: "
  comp_hand.length.times do |num|
    if (num + 1) == comp_hand.length
      print comp_hand[num][0]
      puts comp_hand[num][1]
    else
      print comp_hand[num][0]
      print comp_hand[num][1]
      print " "
    end
  end
  prompt "Dealer's Hand Value: #{calculate_hand_value(comp_hand)}"

end

def display_comp_starting_hand(hand)
  prompt "Dealer's Hand: #{hand[0][0]}#{hand[0][1]}"
end

def players_turn(deck, pls_hand, comp_hand, play_deck)
  loop do
    prompt('Do you want to hit (h) or stay (s)?')
    user_move = gets.chomp
    if user_move == 'h'
      random_element = play_deck.delete_at(rand(play_deck.length))
      pls_hand << random_element
      if calculate_hand_value(pls_hand) > 21
        system 'clear'
        display_players_hand(pls_hand, comp_hand)
        prompt "Bust!"
        prompt "Dealer Wins!"
        sleep(5)
        break
      else
        display_players_hand(pls_hand, comp_hand)
      end
    else
      display_players_hand(pls_hand, comp_hand)
      break
    end
  end
end

def computers_turn(comp_hand, pls_hand, play_deck)
  loop do
    system "clear"
    display_computers_hand(comp_hand, pls_hand)
    if calculate_hand_value(comp_hand) < 17
      random_element = play_deck.delete_at(rand(play_deck.length))
      comp_hand << random_element
      display_computers_hand(comp_hand, pls_hand)
      sleep(5)
    elsif calculate_hand_value(comp_hand) >= 17 && calculate_hand_value(comp_hand) <= 21
      display_computers_hand(comp_hand, pls_hand)
      prompt "The Dealer chooses to stay"
      sleep (5)
      break
    else calculate_hand_value(comp_hand) > 21
      display_computers_hand(comp_hand, pls_hand)
      prompt "Dealer busts!"
      break
    end
  end
end

initial_deck = [["H", "K"], ["H", "Q"], ["H", "J"], ["H", "10"], ["H", "9"], ["H", "8"], ["H", "7"], ["H", "6"], ["H", "5"], ["H", "4"], ["H", "3"], ["H", "2"], ["H", "A"], ["C", "K"], ["C", "Q"], ["C", "J"], ["C", "10"], ["C", "9"], ["C", "8"], ["C", "7"], ["C", "6"], ["C", "5"], ["C", "4"], ["C", "3"], ["C", "2"], ["C", "A"], ["S", "K"], ["S", "Q"], ["S", "J"], ["S", "10"], ["S", "9"], ["S", "8"], ["S", "7"], ["S", "6"], ["S", "5"], ["S", "4"], ["S", "3"], ["S", "2"], ["S", "A"], ["D", "2"], ["D", "3"], ["D", "4"], ["D", "5"], ["D", "6"], ["D", "7"], ["D", "8"], ["D", "9"], ["D", "10"], ["D", "J"], ["D", "Q"], ["D", "K"], ["D", "A"]]

prompt "Welcome to 21. Let's get started."
sleep(5)
#Main loop
loop do
  playing_deck = initial_deck.dup
  players_hand = []
  dealers_hand = []
  play_again = nil
  loop do
    initialize_game(playing_deck, players_hand, dealers_hand)
    display_players_hand(players_hand, dealers_hand)
    players_turn(playing_deck, players_hand, dealers_hand, playing_deck)
    if calculate_hand_value(players_hand) > 21
      break
    else
      computers_turn(dealers_hand, players_hand, playing_deck)
      break
    end     
  end
# win condition
  if calculate_hand_value(players_hand) > calculate_hand_value(dealers_hand) && calculate_hand_value(players_hand) <= 21
    prompt "You Win!"
  elsif calculate_hand_value(dealers_hand) == calculate_hand_value(players_hand)
    prompt "You tied!"
  elsif calculate_hand_value(dealers_hand) > calculate_hand_value(players_hand) && calculate_hand_value(players_hand) <= 21
    prompt "Dealer Wins!"
  end
  
  prompt "Do you want to play again? Yes(y) or No (n)"
  play_again = gets.chomp
  if play_again == "y"
    next
  else
    prompt "Thanks for playing 21!"
    break
  end
end