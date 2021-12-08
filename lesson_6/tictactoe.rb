require_relative 'my_methods_ttt.rb'
require 'colorize'
require 'pry-byebug'

RULES = <<-MSG
 _-------------------------------------------------------------------_
| Tic Tac Toe is a 2 player game played on a 3x3 board. Each player   |
| takes a turn and marks a square on the board. First player to reach |
| 3 squares in a row, including diagonals, wins. If all 9 squares are |
| marked and no player has 3 squares in a row, then the game is a tie.|
^---------------------------------------------------------------------^
MSG

VALID_YES_OR_NO = {
  yes: ['y', 'yes', 'yep'],
  no: ['n', 'no', 'nop']
}

EXIT = { exit: false }
BACK_TO_MENU = 4

PLAYER = 'Player'
COMPUTER = 'Computer'

WINNING_SCORE = nil

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

LEVEL = {
  easy: 'easy',
  normal: 'normal',
  advanced: 'advanced'
}

welcome
turn = nil
level = nil

loop do
  clear_screen
  menu_title "Welcome to the Game"
  choice = principal_menu

  case choice
  when 1
    turn = menu_turn
  when 2
    level = menu_level
  when 3
    if turn && level
      turn, level = start_game turn, level
    else
      clear_screen
      menu_title "Welcome to the Game"
      play = default_game?

      if play
        turn, level = start_game
      else
        prompt "Go back and fill in the required infos ".light_red + \
               "(Level and Turn)".light_yellow
        new_line
        prompt "Press any key to go back!!"
        STDIN.gets
        next
      end
    end

    clear_screen
    menu_title "Welcome to the Game"
    WINNING_SCORE = rounds_you_wish_to_play

    board = ''
    player_score = 0
    computer_score = 0
    EXIT[:exit] = false

    loop do
      board = initialize_board
      who_play_first = turn

      loop do
        display_board(board, player_score, computer_score)
        who_play_first = current_player_piece!(who_play_first, level, board)

        break if someone_won?(board) || board_full?(board) || EXIT[:exit]
      end

      if EXIT[:exit]
        turn = nil
        level = nil
        break
      end

      display_board(board, player_score, computer_score)
      winner = detect_winner(board)
      if someone_won?(board)
        player_score += 1 if winner == PLAYER
        computer_score += 1 if winner == COMPUTER
        display_board(board, player_score, computer_score)
        prompt "#{winner} Take this Round".light_yellow
      else
        prompt "It's a tie!".light_blue
      end

      sleep(1.2)
      if player_score >= WINNING_SCORE || computer_score >= WINNING_SCORE
        load_program("*", 40)
        new_line

        if player_score == WINNING_SCORE
          display_winner PLAYER
        else
          display_winner COMPUTER
        end

        player_score = 0
        computer_score = 0
        break_flag = false

        if play_again?
          load_program "*", 25
          next
        else
          break_game do
            level = nil
            turn = nil
            break_flag = true
          end
        end

        break if break_flag
      end
    end
  when 4
    display_rules
  else
    new_line
    prompt "INVALID CHOICE!!!!"
  end
  clear_screen

  break if choice == 5
end
exit_game
