class PlayerHuman
  attr_reader :mark 
  def initialize(mark, game_io)
    @mark = mark
    @myIo = game_io
  end

  def play_move(game_state)
    board = game_state.game_board
    available_moves = board.available_moves
    @myIo.puts_message("Please input a move: ")
    begin
      choice = @myIo.get_input.to_i
      @myIo.puts_message("That is not a valid move, please try again : ")
    end until available_moves.include?(choice)
    choice
  end
end
