require 'game_io'
require 'game_board'
require 'ai_basic'
require 'game_state'
require 'game_rules'
require 'player'
require 'player_manager'

class TicTacToe

  attr_accessor :board

  def initialize (player1 = nil, player2 = nil)
    @io = GameIo.new
    @players = PlayerManager.new(@io, player1, player2)
    @board = GameBoard.new
    @rules = GameRules.new(@board)
  end

  def game_loop
    until @rules.game_over?
      print_screen
      @players.play_turn(@board)
    end
      print_screen
      print_end_of_game
      true
  end

  def print_end_of_game
    if @rules.tied?
      @io.puts_message("The Game Ended in a Tie!\n")
    elsif @rules.winner
      @io.puts_message("The Winner is #{@rules.winner}!\n")
    end
    @rules.game_over?
  end

  def print_screen
    @io.clear_screen
    @io.puts_message("\n Tic Tac Toe ")
    @io.print_board(@board.spaces, @board.grid_size)
  end
end
