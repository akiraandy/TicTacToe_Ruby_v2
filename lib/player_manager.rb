require 'ai_basic'
require 'ai_minimax'
require 'game_rules'

class PlayerManager

  attr_reader :current_player

  Player = Struct.new(:mark, :type)
  
  def initialize(player1, player2)
    @rules = GameRules.new
    set_player1(player1)
    set_player2(player2)
    @current_player = @player1
  end

   def non_current_player
    (@current_player == @player1) ? @player2 : @player1
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  private
 
  def set_player1(type)
    case type
    when :easy
      @player1 = Player.new(:X, AiBasic.new(@rules))
    when :hard
      @player1 = Player.new(:X, AiMinimax.new(@rules))
    else 
      @player1 = Player.new(:X, :human)
    end
  end

  def set_player2(type)
    case type
    when :easy
      @player2 = Player.new(:O, AiBasic.new(@rules))
    when :hard
      @player2 = Player.new(:O, AiMinimax.new(@rules))
    else 
      @player2 = Player.new(:O, :human)
    end
  end
end
