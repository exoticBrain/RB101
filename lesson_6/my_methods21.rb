def prompt(msg)
  puts "=> #{msg}".bold
end

def take_string
  print ">> ".bold.light_magenta
  gets.chomp.downcase
end

def new_line
  puts
end

def clear_screen
  system "clear"
end

def load_program(marker, length)
  length.times do
    print marker.light_yellow.underline
    sleep 0.03
  end

  new_line
end

def ask_for_name
  prompt "What is your name?".light_blue.bold
  answer = nil
  loop do
    answer = take_string.capitalize!
    break if answer.is_a?(String)
    prompt "INVALIDE NAME!!".light_red
  end

  answer
end

def ask_user_rules?
  prompt "Would you like to have an idea about this Game?(Yes OR No)".light_blue
  rules = nil
  loop do
    answer = take_string
    rules = VALID_REPLAY[:yes].include?(answer)

    break if rules || VALID_REPLAY[:no].include?(answer)
    invalid_choice
  end

  return true if rules
  false
end

def invalid_choice
  prompt "INVALID CHOICE!!".bold.light_green.blink
  prompt "=> Choose 'Y' or 'N'".bold.italic.light_magenta
end

def display_rules
  clear_screen
  puts RULES.light_blue
  new_line
  prompt "Press [ENTER] key to go Back".light_magenta
  STDIN.gets
  clear_screen
end

def initialize_card
  []
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal_initial_hands(player_cards, dealer_cards, deck)
  2.times do
    player_cards << deck.pop
    dealer_cards << deck.pop
  end
end

def rounds
  initialize_score
  prompt "How many rounds You wanna play?".light_green
  answer = nil

  loop do
    print ">> ".light_magenta
    answer = gets.chomp.to_i

    break if answer.is_a?(Integer) && answer > 0
    prompt "INVALID CHOICE!!".light_red
    prompt "=> Choose a number (greather than 0)".bold.italic.light_magenta
  end

  answer
end

def initialize_score
  ROUNDS[:player] = 0
  ROUNDS[:dealer] = 0
end

def display_dearl_hand(dealer_cards)
  puts "-> Dealer's hand : ".bold + "#{dealer_cards[CARD][CARD_FACE]}" \
  " #{SUIT[dealer_cards[CARD][CARD_SUIT]]} and ?".light_blue
end

def hit_or_stay
  prompt "(H)it or (S)tay?"
  exit_loop_and_stay = nil

  loop do
    choice = take_string
    exit_loop_and_stay = VALID_CHOICE[:hit].include?(choice)
    break if exit_loop_and_stay || VALID_CHOICE[:stay].include?(choice)
    prompt "INVALID CHOICE!!".bold.light_green.blink
    prompt "=> Choose 'hit' or 'stay'".bold.italic.light_magenta
  end

  return true if exit_loop_and_stay
  false
end

def someone_hit(turn, cards, deck)
  if turn == PLAYER
    prompt "You chose to hit!".light_green
  else
    prompt "Dealer hits!".light_magenta
  end

  cards << deck.pop
  sleep 1
  display cards, turn
end

def player_turn(player_cards, player_score, deck)
  loop do
    new_line
    break if busted?(player_score) || player_score == FINAL_TARGET
    hit = hit_or_stay

    if hit
      someone_hit PLAYER, player_cards, deck
      player_score = total player_cards
      display_total player_score, PLAYER
      sleep 2
    else
      break
    end
  end

  player_score
end

def stay
  prompt "You choose to stay!".bold.light_green
  new_line
end

def dealer_turn(dealer_cards, dealer_score, deck)
  loop do
    break if dealer_score > DEALER_TARGET_SCORE

    someone_hit DEALER, dealer_cards, deck
    dealer_score = total dealer_cards
    display_total dealer_score, DEALER
    sleep 2
    new_line
  end

  dealer_score
end

def convert(value)
  if value == "A"
    ACE_VALUE
  elsif value.to_i == 0
    JACK_QUEEN_KING
  else
    value.to_i
  end
end

def total(cards)
  values = cards.map { |card| card[CARD_FACE] }
  sum = 0
  values.each do |value|
    sum += convert value
  end
  values.select { |value| value == "A" }.count.times do
    sum -= 10 if sum > FINAL_TARGET
  end

  sum
end

def busted?(score)
  score > FINAL_TARGET
end

def play_again
  new_line
  prompt 'Play again? (Y or N)'.bold.light_blue
  exit_game = nil

  loop do
    answer = take_string
    exit_game = VALID_REPLAY[:yes].include?(answer)
    break if  exit_game || VALID_REPLAY[:no].include?(answer)
    invalid_choice
  end

  return true if exit_game
  false
end

def display(cards, turn)
  load_program('-', LOAD_CARDS)

  print "-> #{turn}'s hand  : ".bold
  cards.each do |suit, card|
    print "#{card}#{SUIT[suit]} ".bold.light_blue
  end

  new_line
  load_program('-', LOAD_CARDS)
end

def display_total(score, turn)
  if turn == PLAYER
    subject = 'You'
    verb = 'have'
  else
    verb = 'has'
    subject = 'He'
  end

  prompt "#{subject} #{verb} #{score} in total.".bold.light_red
end

def display_players(player_cards, player_score, dealer_cards, dealer_score)
  display player_cards, PLAYER
  display_total player_score, PLAYER
  display dealer_cards, DEALER
  display_total dealer_score, DEALER
  load_program '*', LOAD_CHOICE
end

def winner(rounds_target)
  new_line

  if ROUNDS[:player] == rounds_target
    prompt "#{PLAYER} won! #{rounds_target} times in a row.".light_yellow
  else
    prompt "#{DEALER} won! #{rounds_target} times in a row.".light_yellow
  end
end

# rubocop:disable Metrics/AbcSize, Layout/LineLength
def black_jack(turn)
  sleep 1
  clear_screen
  load_program "-", GAME_LOAD
  puts '|                                                             |'.light_yellow
  puts '|                                                             |'.light_yellow
  puts "---------------------- It's a BLACK JACK ----------------------".bold.light_red.blink
  puts "----------------------      #{turn}       ----------------------".bold.light_blue.blink
  puts '|                                                             |'.light_yellow
  puts '|                                                             |'.light_yellow
  load_program "-", GAME_LOAD
end

def welcome
  clear_screen
  load_program "~", GAME_LOAD
  puts '|                                                             |'.light_yellow
  puts '|                                                             |'.light_yellow
  puts "|------------------------ TWENTY ONE -------------------------|".bold.light_red.blink
  puts '|                                                             |'.light_yellow
  puts '|                                                             |'.light_yellow
  load_program "~", GAME_LOAD
end
# rubocop:enable Metrics/AbcSize, Layout/LineLength

def detect_result(player_score, dealer_score)
  if player_score > FINAL_TARGET
    :player_busted
  elsif dealer_score > FINAL_TARGET
    :dealer_busted
  elsif dealer_score < player_score
    :player
  elsif dealer_score > player_score
    :dealer
  else
    :tie
  end
end

def update_score_busted(turn)
  if turn == DEALER
    ROUNDS[:player] += 1
  else
    ROUNDS[:dealer] += 1
  end
end

def update_score(turn)
  if turn == PLAYER
    ROUNDS[:player] += 1
  else
    ROUNDS[:dealer] += 1
  end
end

def display_busted(turn)
  update_score_busted turn

  if turn == PLAYER
    prompt "#{DEALER} won!. #{PLAYER} busted.".light_red
  else
    prompt "#{PLAYER} won!. #{DEALER} busted.".light_red
  end
end

# rubocop:disable Metrics/AbcSize
def winner_cards(turn, player_score, dealer_score)
  update_score turn

  if turn == PLAYER
    prompt "You win! with ".light_red + player_score.to_s.light_blue + \
           " in score. #{DEALER}: ".light_red + dealer_score.to_s.light_blue + \
           " in score.".light_red
  else
    prompt "#{DEALER} won! with ".light_red + dealer_score.to_s.light_blue \
           + " in score. You have ".light_red + player_score.to_s.light_blue + \
           " in score.".light_red
  end
end
# rubocop:enable Metrics/AbcSize

def display_result(player_score, dealer_score)
  result = detect_result player_score, dealer_score

  case result
  when :player_busted
    display_busted PLAYER
  when :dealer_busted
    display_busted DEALER
  when :player
    winner_cards PLAYER, player_score, dealer_score
  when :dealer
    winner_cards DEALER, player_score, dealer_score
  when :tie
    prompt "It's a tie".light_red
  end

  sleep 3
end

def load(turn)
  print "#{turn}'s turn".bold.light_green
  48.times do
    print '.'.light_blue
    sleep 0.03
  end

  new_line
end

# rubocop:disable Metrics/AbcSize, Layout/LineLength
def game_title
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".underline.light_yellow
  # Displaying the score for each one (Player and Dealer) inside the game title in addition to some color features
  puts "|".light_yellow + "Player : ".bold.light_magenta + ROUNDS[:player].to_s.bold.light_blue + \
       " SCORE ".bold.light_magenta + "\t\t\t      " + "Dealer : ".bold.light_magenta + ROUNDS[:dealer].to_s.bold.light_blue + \
       " SCORE".bold.light_magenta + "|".light_yellow
  puts "|                                                             |".light_yellow
  puts "|------------------------ TWENTY ONE -------------------------|".bold.light_red
  puts "|                                                             |".light_yellow
  puts "|                                                             |".light_yellow
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~".underline.light_yellow
end
# rubocop:enable Metrics/AbcSize, Layout/LineLength

def exit_game
  sleep 1
  clear_screen
  puts "\t\tThanks for playing TWENTY ONE.".bold.light_blue
  load_program("*", GAME_LOAD)
  puts "\t\t\t  Goodbye!".bold.light_red.blink
  sleep 3
  clear_screen
end
