require 'pry'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_score(player_score, computer_score)
  system 'clear'
  prompt "Player Score: #{player_score}"
  prompt "Computer Score: #{computer_score}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}}):"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "Invalid input. Please choose an open square."
    end
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  move_counter = 0
  WINNING_LINES.each do |line|
    if brd.values_at(line[0], line[1]).count(PLAYER_MARKER) == 2
      if empty_squares(brd).include?(line[2])
        brd[line[2]] = COMPUTER_MARKER
        move_counter += 1
        break
      end
    elsif brd.values_at(line[1], line[2]).count(PLAYER_MARKER) == 2
      if empty_squares(brd).include?(line[0])
        brd[line[0]] = COMPUTER_MARKER
        move_counter += 1
        break
      end
    elsif brd.values_at(line[0], line[2]).count(PLAYER_MARKER) == 2
      if empty_squares(brd).include?(line[1])
        brd[line[1]] = COMPUTER_MARKER
        move_counter += 1
        break
      end
    end
  end
  if move_counter == 0
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end


def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|

    if brd.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def joinor(array, seperator = ', ', arg3 = 'or' )
  if array.count <= 2
    array.join(" #{arg3} ")
  else
    string = array.join(seperator)
    string[-2] = " #{arg3} "
    string
  end
end

loop do
  computer_score = 0
  player_score = 0
  loop do
    board = initialize_board

    loop do
      display_score(player_score, computer_score)
      display_board(board)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    system "clear"
    if detect_winner(board) == 'Player'
      player_score += 1
    elsif detect_winner(board) == 'Computer'
      computer_score += 1
    end

    display_score(player_score, computer_score)
    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
    else
      prompt "It's a tie!"
    end

    if player_score == 5
      break
    elsif player_score == 5
      break
    end

  end
  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
