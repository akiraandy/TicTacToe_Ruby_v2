require 'player'
require 'game_state'
require 'ai_basic'
class PlayerManager

  attr_reader :current_player

  def initialize(game_io, player1 = nil, player2 = nil)
      @myIo = game_io
      @player1 = player1
      @player2 = player2
      @player1 = Player.new('X', :Human ) if @player1.nil?
      @player2 = Player.new('O', :AiBasic ) if @player2.nil?
      @current_player = @player1
      @ai = AiBasic.new
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def non_current_player
    (@current_player == @player1) ? @player2 : @player1
  end

  def play_turn(board)
    @state = GameState.new(board, @current_player, non_current_player)
    if @current_player.type == :Human
      move = get_human_move
    elsif @current_player.type == :AiBasic
      move = @ai.play_move(@state)
    end
    board.spaces[move] = @current_player.mark
    switch_turns
  end

  private

  def get_human_move
    board = @state.game_board
    available_moves = board.available_moves
    @myIo.puts_message("Please input a move: ")
    begin
      choice = @myIo.get_input.to_i
      @myIo.puts_message("That is not a valid move, please try again : ")
    end until available_moves.include?(choice)
    choice
  end
end
