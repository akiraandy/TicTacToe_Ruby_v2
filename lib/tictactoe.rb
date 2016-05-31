require 'game_board'
require 'game_rules'
require 'game_state'
require 'player_manager'

class TicTacToe

  def initialize(player_manager, board, rules)
    @rules = rules
    @board = board
    @players = player_manager
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
      @board.play_move(@players.current_player.mark, move)
      @players.switch_turns
    end
  end

  def valid_move?(move)
    @board.valid_move?(move)
  end

  def get_ai_player_move
    @players.current_player.type.get_move(get_game_state) if is_current_player_ai?
  end

  def is_current_player_ai?
    @players.current_player.type.respond_to?(:get_move)
  end

  private

  def get_game_state
    GameState.new(@board, @players.current_player.mark, @players.non_current_player.mark)
  end
end
