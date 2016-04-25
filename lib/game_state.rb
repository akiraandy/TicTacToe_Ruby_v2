class GameState
  attr_accessor :game_board, :player, :opponent
  def initialize(game_board, player_mark, opponent_mark)
    @game_board = game_board.deep_copy
    @player = player_mark
    @opponent = opponent_mark
  end

  def deep_copy
    temp_board = game_board.deep_copy
    GameState.new(temp_board, @player, @opponent)
  end
end
