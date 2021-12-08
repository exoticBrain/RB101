def prompt(msg)
  puts "=> #{msg}".bold
end

def take_number
  print "$-> ".bold.light_yellow
  gets.chomp.to_i
end

def take_string
  print "$=> ".bold.light_yellow
  gets.chomp.downcase
end

def welcome
  clear_screen
  load_program("*", 63)
  puts("\n\t\t\tTic Tac Toe".light_red.bold)
  load_program("*", 63)
  new_line
  new_line
  sleep 1
  clear_screen
end

def new_line
  puts
end

def clear_screen
  system "clear"
end

def principal_menu
  prompt "1) Players turn".light_blue
  prompt "2) Game level".light_blue
  prompt "3) Start".light_blue
  prompt "4) RULES".light_blue
  prompt "5) Exit".light_red
  new_line
  take_number
end

def display_rules
  clear_screen
  puts RULES.bold.light_blue
  new_line
  prompt "Press any key to go back!".light_red
  STDIN.gets
end

def menu_title(msg)
  puts "^-------------------| #{msg} |--------------------^".light_green.bold
end

# rubocop:disable Layout/LineLength
def game_info(player_score, computer_score)
  print "You're '#{PLAYER_MARKER}' have => ".light_blue + player_score.to_s.light_red + " in score.".light_blue
  print " Computer is '#{COMPUTER_MARKER}' has => ".light_blue + computer_score.to_s.light_red + " in score.".light_blue
end

def display_player(turn)
  clear_screen
  new_line
  prompt "----------------- #{turn} will go first ---------------------".light_red
  sleep(1.7)
  clear_screen
end
# rubocop:enable Layout/LineLength

def display_menu_turn
  clear_screen
  menu_title "Players turn"
  prompt "1) #{PLAYER} goes first".light_blue
  prompt "2) #{COMPUTER} goes first".light_blue
  prompt "3) Pick randomly".light_blue
  prompt "4) Back".light_red
  new_line
  take_number
end

def chose_who_play(choice)
  case choice
  when 1
    display_player PLAYER
    PLAYER
  when 2
    display_player COMPUTER
    COMPUTER
  when 3
    guessed_turn = [PLAYER, COMPUTER].sample
    display_player guessed_turn
    guessed_turn
  when 4
    BACK_TO_MENU
  end
end

def menu_turn
  load_program "*", 15
  clear_screen
  turn = nil

  loop do
    choice = display_menu_turn
    load_program "*", 15
    turn = chose_who_play choice

    break if turn == BACK_TO_MENU || turn.is_a?(String)
    prompt "INVALID CHOICE!!".light_green
    sleep 1.3
  end
  turn = nil if turn == BACK_TO_MENU

  turn
end

def display_menu_level
  clear_screen
  menu_title "Game level"
  prompt "1) Easy".light_blue
  prompt "2) Normal".light_blue
  prompt "3) Advanced".light_blue
  prompt "4) Back".light_red
  new_line
  take_number
end

def chose_level(choice)
  case choice
  when 1
    'easy'
  when 2
    'normal'
  when 3
    'advanced'
  when 4
    load_program("*", 15)
    BACK_TO_MENU
  end
end

def menu_level
  load_program "*", 15
  clear_screen
  level = nil

  loop do
    choice = display_menu_level
    load_program "*", 15
    level = chose_level choice

    break if level == BACK_TO_MENU || level.is_a?(String)
    prompt "INVALID CHOICE!!".light_green
    sleep 1.3
  end
  level = nil if level == BACK_TO_MENU

  level
end

def invalid_choice
  prompt "INVALID CHOICE".light_green
  prompt "Chose (Y)es or (N)o".light_magenta
end

def default_game?
  prompt "Would you like to play the default game? ('Y' or 'N')".light_blue
  default = nil

  loop do
    answer = take_string
    default = VALID_YES_OR_NO[:yes].include?(answer)

    break if default || VALID_YES_OR_NO[:no].include?(answer)
    invalid_choice
  end

  return true if default
  false
end

def rounds_you_wish_to_play
  prompt "How many rounds do you wish to play?".light_blue
  take_number
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Layout/LineLength
def display_board(brd, pl, cmpt)
  clear_screen
  game_info(pl, cmpt)
  new_line
  new_line
  puts "       |       |"
  puts "       |       |"
  puts "   #{brd[1]}   |   #{brd[2]}   |   #{brd[3]}"
  puts "       |       |"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "       |       |"
  puts "   #{brd[4]}   |   #{brd[5]}   |   #{brd[6]}" + "\t\tPress 10 to exit the game".light_red
  puts "       |       |"
  puts "       |       |"
  puts "-------+-------+-------"
  puts "       |       |"
  puts "       |       |"
  puts "   #{brd[7]}   |   #{brd[8]}   |   #{brd[9]}"
  puts "       |       |"
  puts "       |       |"
  new_line
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize, Layout/LineLength

def initialize_board
  new_bord = {}
  (1..9).each { |num| new_bord[num] = INITIAL_MARKER }
  new_bord
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a position to place a piece: " \
           "#{joinor(empty_squares(brd))}".light_magenta
    square = take_number

    if square == 10
      yield
      break
    end

    break if empty_squares(brd).include?(square) || square == 10
    prompt "INVALID SQUARE!!!".light_green
  end

  brd[square] = PLAYER_MARKER if !EXIT[:exit]
end

def find_at_risk_square(board, marker)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(marker) == 2
      line.each do |index|
        if board[index] == " "
          return index
        end
      end
    end
  end
  nil
end

def computer_places_piece!(board, level)
  square = 0

  case level
  when LEVEL[:easy]
    square = empty_squares(board).sample
  when LEVEL[:normal]
    square = normal_level board
  when LEVEL[:advanced]
    square = advanced_level board
  end

  board[square] = COMPUTER_MARKER
end

def normal_level(brd)
  find_at_risk_square(brd, PLAYER_MARKER) || empty_squares(brd).sample
end

def advanced_level(brd)
  if find_at_risk_square(brd, COMPUTER_MARKER)
    find_at_risk_square(brd, COMPUTER_MARKER)
  elsif find_at_risk_square(brd, PLAYER_MARKER)
    find_at_risk_square(brd, PLAYER_MARKER)
  else
    empty_squares(brd).sample
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
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return PLAYER
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return COMPUTER
    end
  end

  nil
end

# rubocop:disable Metrics/AbcSize, Style/ConditionalAssignment
def joinor(arr, delimiter = ', ', linker = 'or')
  joined_string = ''

  if arr.size == 2
    joined_string << arr[0].to_s + ' ' + linker + ' ' + arr[1].to_s
  elsif arr.size == 1
    joined_string << arr[0].to_s
  else
    arr.each_with_index do |number, index|
      if index == arr.size - 1
        joined_string << linker + ' ' + number.to_s
      else
        joined_string << number.to_s + delimiter
      end
    end
  end

  joined_string
end
# rubocop:enable Metrics/AbcSize, Style/ConditionalAssignment

def load_program(stuff, length)
  length.times do
    print(stuff.light_magenta)
    sleep(0.03)
  end
end

def start_game(turn = PLAYER, level = 'normal')
  [turn, level]
end

def current_player_piece!(turn, level, board)
  if turn == PLAYER
    player_places_piece!(board) do
      new_line
      prompt "You'll go back to the menu.".light_red
      load_program("*", 35)
      EXIT[:exit] = true
    end
    COMPUTER
  else
    computer_places_piece!(board, level)
    PLAYER
  end
end

def display_winner(turn)
  new_line
  prompt "#{turn} Won! #{WINNING_SCORE} times in a row".light_red
  new_line
end

def play_again?
  prompt %(play again? "Y or N").light_blue
  keep_playing = nil

  loop do
    replay = take_string
    keep_playing = VALID_YES_OR_NO[:yes].include?(replay)
    break if keep_playing || VALID_YES_OR_NO[:no].include?(replay)
    invalid_choice
  end

  return true if keep_playing
  false
end

def break_game
  load_program "*", 25
  yield
end

def exit_game
  puts "\t\tThanks for playing Tic Tac Toe.".light_green.bold
  load_program("*", 63)
  puts "\n\t\t\t   Goodbye!".light_blue.bold.blink
  sleep(3)
  clear_screen
end
