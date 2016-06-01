require 'game_board'
require 'game_rules'
require 'game_state'

class TicTacToe

  def initialize(rules, board)
    @rules = rules
    @board = board 
  end

  def get_board
    @board.spaces
  end

  def available_moves
    @board.available_moves
  end

  def game_over?
    @rules.game_over?(@board)
  end

  def tied_game?
    @rules.tied?(@board)
  end

  def winner
    @rules.winner(@board)
  end

  def play_move(move)
    if valid_move?(move)
      @board.play_move(move)
    end
  end

  def valid_move?(move)
    @board.valid_move?(move)
  end
  
  def get_game_state
    GameState.new(@board, @board.current_player_mark, @board.non_current_player_mark)
  end
end
