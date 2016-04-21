require 'game_io'
require 'game_board'
require 'ai_basic'
require 'game_state'
require 'game_rules'
require 'player'
require 'player_manager'

class TicTacToe

  attr_accessor :myBoard

  def initialize (player1 = nil, player2 = nil)
    @myIo = GameIo.new
    @players = PlayerManager.new(@myIo, player1, player2)
    @myBoard = GameBoard.new
    @rules = GameRules.new(@myBoard)
  end

  def game_loop
    until @rules.game_over?
      print_screen
      @players.play_turn(@myBoard)
    end
      print_screen
      print_end_of_game
      true
  end

  def print_end_of_game
    if @rules.tied?
      @myIo.puts_message("The Game Ended in a Tie!\n")
    elsif @rules.winner
      @myIo.puts_message("The Winner is #{@rules.winner}!\n")
    end
    @rules.game_over?
  end

  def print_screen
    @myIo.clear_screen
    @myIo.puts_message("\n Tic Tac Toe ")
    @myIo.print_board(@myBoard.spaces, @myBoard.grid_size)
  end
end
