require 'game_board'
require 'game_rules'
require 'player_manager'
require 'game_loop'
require 'game_screen'
class TicTacToe

  attr_accessor :board, :game_loop

  def initialize ()

  end
 
  def new_game
    @board = GameBoard.new
  end

  def game_over?

  end
 
end
