class PlayerAiMinimax
   attr_reader :mark

  CORNERS = [0,2,6,8]

  def initialize(player_mark, board_rules)
    @mark = player_mark
    @rules = board_rules
  end

  def play_move(game_state)
    @current_player = game_state.player
    @non_current_player = game_state.opponent
    board = game_state.game_board
    move = nil
    move ||= first_turn(board)
    move ||= best_move(board, game_state.player, game_state.opponent)
    move

  end

  private

  attr_reader :rules

  def first_turn(board)
    move = nil
    move ||= corner_move(board) if board.empty?
    move ||= 4 if opponent_played_corner_for_first_move(board)
    move ||= corner_move(board) if board.available_moves.size == 8
    move
  end

  def corner_move(board)
    available_corners = CORNERS & board.available_moves
    available_corners.sample
  end

  def opponent_played_corner_for_first_move(board)
    CORNERS.any? { |corner| board.spaces[corner] != ' '} if (board.available_moves.size == 8)
  end

  def best_move(board, player, opponent)
    moves = board.available_moves
    scores = []
    moves.each.with_index do |move, i|
      temp_board = board.deep_copy
      temp_board.spaces[move] = player
      scores[i] = minimax(temp_board, opponent, player, 0)
    end

    max_score_index = scores.each_with_index.max[1]
    moves[max_score_index]
  end

  def minimax(board, player, opponent, depth)
    return score(board, depth) if rules.game_over?(board)
    scores = []
    moves = []
    board.available_moves.each do |move|
      possible_game_board = board.deep_copy
      possible_game_board.spaces[move] = player
      scores.push minimax(possible_game_board, opponent, player, depth + 1)
      moves.push move
    end

    if player == @current_player
      max_score_index = scores.each_with_index.max[1]
      return scores[max_score_index]
    else
      min_score_index = scores.each_with_index.min[1]
      return scores[min_score_index]
    end
  end

  def score(board, depth)
    return 10 - depth if rules.winner(board) == @current_player
    return depth - 10  if rules.winner(board) == @non_current_player
    return 0 - depth
  end
end
