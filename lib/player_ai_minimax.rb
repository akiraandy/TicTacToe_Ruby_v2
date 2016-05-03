class PlayerAiMinimax
  attr_reader :mark

  CORNERS = [0,2,6,8]
  OPPOSITE_CORNERS = [8,6,2,0]
  def initialize(player_mark, board_rules)
    @mark = player_mark
    @rules = board_rules
  end

  def play_move(game_state)
    @current_player = game_state.player
    @non_current_player = game_state.opponent
    board = game_state.game_board
    if first_move?(board)
      move = first_turn(board)
    elsif second_move?(board)
      move = second_turn(board)
    end
    move ||= best_move(board, game_state.player, game_state.opponent)
  end

  private

  attr_reader :rules

  def first_move?(board)
    board.available_moves.size > 7
  end

  def second_move?(board)
    board.available_moves.size == 7
  end

  def first_turn(board)
    move = (opponent_played_corner_for_first_move(board)) ? 4 : corner_move(board)
    move
  end

  def second_turn(board)
      move = opponent_played_opposite_side_for_turn2(board)
      CORNERS.each.with_index do |val, i|
        move ||= OPPOSITE_CORNERS[i] if (board.spaces[val] == @mark && \
                                         board.spaces[OPPOSITE_CORNERS[i]] == ' ')
    end
    move
  end

  def opponent_played_opposite_side_for_turn2(board)
    if (board.spaces[0] == @current_player && \
        (board.spaces[5] == @non_current_player || board.spaces[7] == @non_current_player))
      move = 2
    elsif (board.spaces[2] == @current_player && \
           (board.spaces[3] == @non_current_player || board.spaces[7] == @non_current_player))
      move = 0
    elsif (board.spaces[6] == @current_player && \
           (board.spaces[1] == @non_current_player || board.spaces[5] == @non_current_player))
      move = 8
    elsif (board.spaces[8] == @current_player && \
           (board.spaces[1] == @non_current_player || board.spaces[3] == @non_current_player))
      move = 6
    end
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
    best_score(scores, player)
  end

  def best_score(scores, player)
    score_index = (player == @current_player) ? \
      scores.each_with_index.max[1] : scores.each_with_index.min[1]
    scores[score_index]
  end

  def score(board, depth)
    case rules.winner(board)
    when @current_player
      score = 10 - depth
    when @non_current_player
      score = depth - 10
    else
      score = 0 - depth
    end
    score
  end
end
