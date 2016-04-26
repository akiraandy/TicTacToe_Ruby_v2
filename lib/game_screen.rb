class GameScreen

  def initialize(io, board, players, rules, legend, legend_size)
    @io = io
    @board = board
    @players = players
    @rules = rules
    @legend = legend
    @legend_size = legend_size
  end

  def print_end_of_game
    if @rules.tied?(@board)
      @io.puts_message("The Game Ended in a Tie!\n")
    elsif @rules.winner(@board)
      @io.puts_message("The Winner is #{@rules.winner(@board)}!\n")
    end
  end

  def print_screen
    @io.clear_screen
    @io.puts_message("\n Legend ")
    @io.print_board(@legend, @legend_size)
    @io.puts_message("\n Tic Tac Toe ")
    @io.print_board(@board.spaces, @board.grid_size)
  end
end
