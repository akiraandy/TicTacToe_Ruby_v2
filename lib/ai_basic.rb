class AiBasic

  def initialize(rules)
    @rules = rules
  end

  def get_move(game_state)
    board = game_state.game_board
    available_moves = game_state.game_board.available_moves
    @player = game_state.player
    @opponent = game_state.opponent
    choice = get_corner(board, available_moves) if board.empty?
    choice = play_to_win(board, available_moves) if choice.nil?
    choice = play_to_block(board, available_moves) if choice.nil?
    choice = get_corner(board, available_moves) if choice.nil?
    choice = get_random_move(available_moves) if choice.nil?
    choice
  end

private

  def get_random_move(available_moves)
    index = rand(0...available_moves.size)
    available_moves[index]
  end

  def get_corner(board, available_moves)
    available_corners =  corners(board.grid_size) & available_moves
    if available_corners.size > 0
      index = rand(0...available_corners.size)
      available_corners[index]
    end
  end

  def corners(grid_size)
    rtn_corners = [0]
    rtn_corners << grid_size - 1
    rtn_corners << (grid_size * grid_size) - grid_size
    rtn_corners << (grid_size * grid_size) - 1
    rtn_corners
  end

  def play_to_block(board, available_moves)
    swap_players
    choice = play_to_win(board, available_moves)
    swap_players
    choice
  end

  def swap_players
    @player, @opponent = @opponent, @player
  end

  def play_to_win(board, available_moves)
    choice = nil;
    available_moves.each.with_index do |val, index|
      board.spaces[val] = @player
      if (@rules.winner(board) == @player)
        choice = val
      end
      board.spaces[val] = ' '
      break if !choice.nil?
    end
    choice
  end
end
