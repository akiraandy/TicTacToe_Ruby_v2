require 'ai_basic'
require 'ai_minimax'
require 'game_board'
require 'game_rules'
require 'game_state'
require 'player_manager'

class TicTacToe

  def initialize
    @rules = GameRules.new
    @board = GameBoard.new
    @players = PlayerManager.new
    @ai_easy = AiBasic.new(@rules)
    @ai_hard = AiMinimax.new(@rules)
  end

  def new_game
    @board = GameBoard.new
  end

  def get_board
    @board.spaces
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

  def play_human_move(move)
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

  def set_player1_ai_easy
    @players.set_player1_type(@ai_easy)
  end

  def set_player2_ai_easy
    @players.set_player2_type(@ai_easy)
  end

  def set_player1_ai_hard
    @players.set_player1_type(@ai_hard)
  end

  def set_player2_ai_hard
    @players.set_player2_type(@ai_hard)
  end

  private

  def is_current_player_ai?
    @players.current_player.type.respond_to?(:get_move)
  end

  def get_game_state
    GameState.new(@board, @players.current_player.mark, @players.non_current_player.mark)
  end
end
