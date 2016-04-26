require 'game_board'
require 'game_rules'
require 'player_manager'
require 'game_loop'
require 'game_screen'
class TicTacToe

  attr_accessor :board, :game_loop

  def initialize (game_io, player1, player2)

    @io = game_io
    @players = PlayerManager.new(@io, player1, player2)
    @board = GameBoard.new
    @rules = GameRules.new
    @legend = ['0', '1', '2', '3', '4', '5', '6', '7', '8']
    @legend_size = 3
    @game_screen = GameScreen.new(@io, @board, @players, @rules, @legend, @legend_size)
    @game_loop = GameLoop.new(@board, @game_screen, @rules, @players)
  end

  def play_game
    begin
    @game_loop.game_loop
    @board.new_game
    end while (play_again?)
  end

  def play_again?
    @io.puts_message("Play again (Y/N) : ")
    input = @io.get_input
    return true if (input == "y" || input == "Y")
    false
  end
end
