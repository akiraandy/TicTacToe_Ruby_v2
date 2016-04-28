class PlayerAiMinimax
  attr_reader :mark

  def initialize(mark, rules)
    @mark = mark
    @rules = rules
  end

  def play_move(game_state)
    @board = game_state.game_board
    @spaces = @board.spaces
    @available_moves = @board.available_moves
    @player = game_state.player
    @opponent = game_state.opponent
    
    if (@available_moves.size == 1) 
      return @available_moves[0]
    end
    @available_moves.size
  end

  
end

