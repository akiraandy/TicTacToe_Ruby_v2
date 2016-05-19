class AiMinimax

  CORNERS = [0,2,6,8]
  OPPOSITE_CORNERS = [8,6,2,0]
  def initialize(board_rules)
    @rules = board_rules
  end

  def get_move(game_state)
    @current_player = game_state.player
    @non_current_player = game_state.opponent
    board = game_state.game_board
    if first_move?(board)
      first_turn(board)
    else
      best_move(board, game_state.player, game_state.opponent)
    end
  end

  private

  def first_move?(board)
    board.available_moves.size > 7
  end

  def first_turn(board)
    opponent_played_corner_for_first_move?(board) ? 4 : corner_move(board)
  end

  def corner_move(board)
    available_corners = CORNERS & board.available_moves
    available_corners.sample
  end

  def opponent_played_corner_for_first_move?(board)
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
    return score(board, depth) if @rules.game_over?(board)
    scores = []
    moves = []
    board.available_moves.each do |move|
      possible_game_board = board.deep_copy
      possible_game_board.spaces[move] = player
      scores.push minimax(possible_game_board, opponent, player, depth + 1)
      moves.push move
    end
    best_score(scores, player)
  end

  def best_score(scores, player)
    min_or_max = (player == @current_player) ? :max : :min
    score_index = scores.each_with_index.send(min_or_max)[1]
    scores[score_index]
  end

  def score(board, depth)
    case @rules.winner(board)
    when @current_player
      10 - depth
    when @non_current_player
      depth - 10
    else
      0 - depth
    end
  end
end
