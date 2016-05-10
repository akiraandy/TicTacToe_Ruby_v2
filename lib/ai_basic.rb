class AiBasic

  def initialize(rules)
    @rules = rules
  end

  def get_move(game_state)
    @board = game_state.game_board
    @spaces = game_state.game_board.spaces
    @available_moves = game_state.game_board.available_moves
    @player = game_state.player
    @opponent = game_state.opponent
    choice = get_corner if @board.empty?
    choice = play_to_win if choice.nil?
    choice = play_to_block if choice.nil?
    choice = get_corner if choice.nil?
    choice = get_random_move if choice.nil?
    choice
  end

private

  def get_random_move
    index = rand(0...@available_moves.size)
    @available_moves[index]
  end

  def get_corner
    corners = [0, 2, 6, 8]
    available_corners =  corners & @available_moves
    if available_corners.size > 0
      index = rand(0...available_corners.size)
      available_corners[index]
    end
  end

  def play_to_block
    swap_players
    choice = play_to_win
    swap_players
    choice
  end

  def swap_players
    @player, @opponent = @opponent, @player
  end

  def play_to_win
    choice = nil;
    @available_moves.each.with_index do |val, index|
      @spaces[val] = @player
      if (@rules.winner(@board) == @player)
        choice = val
      end
      @spaces[val] = ' '
      break if !choice.nil?
    end
    choice
  end
end
