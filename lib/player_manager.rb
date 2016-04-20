require 'player'
require 'game_state'
require 'ai_basic'
class PlayerManager

  attr_reader :current_player

  def initialize(game_io, player1 = nil, player2 = nil)
      @myIo = game_io
      @player1 = player1
      @player2 = player2
      @player1 = Player.new(:X, @myIo) if @player1.nil?
      @player2 = AiBasic.new(:O, @myIo) if @player2.nil?
      @current_player = @player1
  end

  def non_current_player
    (@current_player == @player1) ? @player2 : @player1
  end

  def play_turn(board)
    @state = GameState.new(board, @current_player.mark, non_current_player.mark)
    move = @current_player.play_move(@state)
    board.spaces[move] = @current_player.mark

    @current_player = (@current_player == @player1) ? @player2 : @player1
  end
end