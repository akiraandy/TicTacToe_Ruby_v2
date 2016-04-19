require 'game_io'
require 'game_board'
require 'ai_basic'
require 'game_state'
require 'game_rules'

class TicTacToe

  attr_reader :current_player, :myBoard

  def initialize
    @myIo = GameIo.new
    @player1 = 'X'
    @player2 = 'O'
    @current_player = @player1
    @myBoard = GameBoard.new
    @rules = GameRules.new(@myBoard)
    @ai = AiBasic.new
  end

  def game_loop
    begin
      print_screen
      play_turn
    end while @rules.game_status == :playing
      print_screen
      winner = "The winner is #{@rules.game_status}\n"
      @myIo.puts_message(winner)
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def non_current_player
    (@current_player == @player1) ? @player2 : @player1
  end

  def print_screen
    @myIo.clear_screen
    @myIo.puts_message("\n Tic Tac Toe ")
    @myIo.print_board(@myBoard.spaces, @myBoard.grid_size)
  end

  def play_turn
    state = GameState.new(@myBoard, @current_player, non_current_player)
    if @current_player == @player1
      move = get_human_move
    else
      move = @ai.play_move(state)
    end
    @myBoard.spaces[move] = @current_player
    switch_turns
  end

  def get_human_move
    available_moves = @myBoard.available_moves
    @myIo.puts_message("Please input a move: ")
    begin
      choice = @myIo.get_input.to_i
      @myIo.puts_message("That is not a valid move, please try again : ")
    end until available_moves.include?(choice)
    choice
  end

end
