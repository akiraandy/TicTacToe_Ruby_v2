class Game_State
  attr_accessor :game_board, :player, :opponent
  def initialize(game_board, player_mark, opponent_mark)
    @game_board = game_board.dup
    @player = player_mark
    @opponent = opponent_mark
  end
end
