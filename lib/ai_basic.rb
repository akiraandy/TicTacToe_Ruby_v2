require 'game_rules'

class AiBasic
  def initialize

  end

  def play_move(game_state)
    return 0 if game_state.game_board.empty?
    @rules = GameRules.new(game_state.game_board)
    move = play_to_win(game_state)
    return move if !move.nil?
    move = play_to_block(game_state)
    return move if !move.nil?
    get_random_move(game_state)
  end

  def play_to_win(game_state)
    moves = game_state.game_board.available_moves
    moves.each do |move|
      temp = game_state.deep_copy
      temp.game_board.spaces[move] = game_state.player
      return move if @rules.game_status == game_state.player
    end
    nil
  end

  def play_to_block(game_state)
    game_state.switch_turns
    move = play_to_win(game_state)
    game_state.switch_turns
    move
  end

  def get_random_move(game_state)
    moves = game_state.game_board.available_moves
    i = rand(moves.size)
    moves[i]
  end

end
