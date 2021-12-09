require_relative 'my_methods21.rb'
require 'colorize'

RULES = <<-MSG
 _-------------------------------------------------------------------------_
| * OBJECT OF THE GAME *                                                    |
|     - Each participant attempts to beat the dealer by getting a count     |
|       as close to 21 as possible, without going over 21.                  |
| * Setup *                                                                 |
|     - the game consists of a "dealer" and a "player". Both participants   |
|       are initially dealt 2 cards. The player can see their 2 cards,      |
|       but can only see one of the dealer's cards.                         |
| * CARD VALUES *                                                           |
|     - The numbers 2 through 10 are worth their face value. The jack,      |
|       queen, and king are each worth 10, and the ace can be worth 1 or 11 |
^---------------------------------------------------------------------------^
MSG

VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
SUITS = %w(C D H S)

VALID_REPLAY = {
  yes: ['y', 'yes', 'ye', 'yep', 'yeah'],
  no: ['n', 'no', 'naah', 'nop']
}

DEALER = 'Dealer'

FINAL_TARGET = 21
DEALER_TARGET_SCORE = 17

LOAD_CHOICE = 40
LOAD_CARDS = 25
GAME_LOAD = 63

ACE_VALUE = 11
JACK_QUEEN_KING = 10

VALID_CHOICE = {
  stay: ['s', 'stay', 'sta', 'st'],
  hit: ['h', 'hi', 'hit']
}

SUIT = {
  'C' => "\u2663".encode('utf-8'),
  'D' => "\u2666".encode('utf-8'),
  'H' => "\u2665".encode('utf-8'),
  'S' => "\u2664".encode('utf-8')
}

ROUNDS = {
  player: 0,
  dealer: 0
}

clear_screen
PLAYER = ask_for_name

user_wants_to_read_rules = ask_user_rules?
display_rules if user_wants_to_read_rules

loop do
  welcome
  rounds_target = rounds

  loop do
    deck = initialize_deck
    player_cards = initialize_card
    dealer_cards = initialize_card

    2.times do
      player_cards << deck.pop
      dealer_cards << deck.pop
    end

    dealer_score = total dealer_cards
    player_score = total player_cards

    clear_screen
    game_title

    display_dearl_hand dealer_cards
    display player_cards, PLAYER
    display_total player_score, PLAYER

    new_line
    load PLAYER

    player_score = player_turn player_cards, player_score, deck

    new_line
    if busted?(player_score)
      display_result player_score, dealer_score
    elsif player_score == FINAL_TARGET
      update_score PLAYER
      black_jack PLAYER
    else
      load_program '*', LOAD_CARDS
      stay
      load DEALER

      dealer_score = dealer_turn dealer_cards, dealer_score, deck

      if busted?(dealer_score)
        display_result player_score, dealer_score
      elsif dealer_score == FINAL_TARGET
        update_score DEALER
        black_jack DEALER
      else
        display player_cards, PLAYER
        display_result player_score, dealer_score
      end
    end
    dealer_won = ROUNDS[:dealer] >= rounds_target
    player_won = ROUNDS[:player] >= rounds_target

    break if dealer_won || player_won
  end
  clear_screen
  game_title
  winner rounds_target

  play_again ? next : break
end
exit_game
