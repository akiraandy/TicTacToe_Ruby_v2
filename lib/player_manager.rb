require 'ai_basic'
require 'ai_minimax'
require 'game_rules'

class PlayerManager

  attr_reader :current_player

  Player = Struct.new(:mark, :type)

  def initialize(player_type1, player_type2)
    @rules = GameRules.new
    @player1 = set_player(:X, player_type1)
    @player2 = set_player(:O, player_type2)
    @current_player = @player1
  end

  def non_current_player
    (@current_player == @player1) ? @player2 : @player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  private

  def set_player(mark, type)
    case type.to_sym
    when :easy
      Player.new(mark, AiBasic.new(@rules))
    when :hard
      Player.new(mark, AiMinimax.new(@rules))
    else 
      Player.new(mark, :human)
    end
  end
end
