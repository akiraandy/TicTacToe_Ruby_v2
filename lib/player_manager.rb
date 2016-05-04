require 'ai_basic'
require 'ai_minimax'
require 'game_rules'
class PlayerManager

  attr_reader :current_player

  Player = Struct.new(:mark, :type)

  def initialize()
      @player1 = Player.new(:X, :Human)
      @player2 = Player.new(:O, :Human)
      @current_player = @player1
  end

  def set_player1_type(type)
    @player1.type = type
  end

  def set_player2_type(type)
    @player2.type = type
  end

  def non_current_player
    (@current_player == @player1) ? @player2 : @player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end
