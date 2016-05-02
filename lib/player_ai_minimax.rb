class PlayerAiMinimax
  attr_reader :mark

  def initialize(mark, rules)
    @mark = mark
    @rules = rules
    @corners = [0,2,6,8]
  end

  def play_move(game_state)
    board = game_state.game_board
    return 0 if board.empty?
    return 4 if opponent_played_corner_for_first_move(board)
    return corner_move(board) if board.available_moves.size == 8
    @current_player = game_state.player
    @non_current_player = game_state.opponent
    minimax(board, game_state.player, game_state.opponent)
    @choice
  end

  private

  def corner_move(board)
    available_corners = @corners & board.available_moves
    i = Random.rand(available_corners.size)
    available_corners[i]
  end

  def opponent_played_corner_for_first_move(board)
    @corners.any? { |corner| board.spaces[corner] != ' '} if (board.available_moves.size == 8)
  end
  
  def score(board)
    return 10 if @rules.winner(board) == @current_player
    return -10 if @rules.winner(board) == @non_current_player
    return 0
  end

  def minimax(board, player, opponent)
    return score(board) if @rules.game_over?(board)
    scores = []
    moves = []
    board.available_moves.each do |move|
      possible_game_board = board.deep_copy
      possible_game_board.spaces[move] = player
      scores.push minimax(possible_game_board, opponent, player)
      moves.push move
    end
    if player == @current_player
      max_score_index = scores.each_with_index.max[1]
      @choice = moves[max_score_index]
      return scores[max_score_index]
    else
      min_score_index = scores.each_with_index.min[1]
      @choice = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end

