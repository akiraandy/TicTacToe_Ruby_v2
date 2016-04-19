require 'game_rules'

class AiBasic

  def play_move(game_state)
    board = game_state.game_board
    @spaces = game_state.game_board.spaces
    @available_moves = game_state.game_board.available_moves
    @player = game_state.player
    @opponent = game_state.opponent

    choice = get_corner if board.empty?
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

# **** todo refactor this code
  def play_to_win
    if @available_moves.include?(0)
      if @spaces[1] == @spaces[2] && @spaces[1] == @player || \
         @spaces[3] == @spaces[6] && @spaces[3] == @player || \
         @spaces[4] == @spaces[8] && @spaces[4] == @player
        return 0
      end
    end

    if @available_moves.include?(1)
      if @spaces[0] == @spaces[2] && @spaces[0] == @player || \
         @spaces[4] == @spaces[7] && @spaces[4] == @player
        return 1
      end
    end

    if @available_moves.include?(2)
      if @spaces[0] == @spaces[1] && @spaces[0] == @player || \
         @spaces[5] == @spaces[8] && @spaces[5] == @player || \
         @spaces[4] == @spaces[6] && @spaces[4] == @player
        return 2
      end
    end

    if @available_moves.include?(3)
      if @spaces[4] == @spaces[5] && @spaces[5] == @player || \
         @spaces[0] == @spaces[6] && @spaces[0] == @player
        return 3
      end
    end

    if @available_moves.include?(4)
      if @spaces[3] == @spaces[5] && @spaces[5] == @player || \
         @spaces[1] == @spaces[7] && @spaces[1] == @player || \
         @spaces[0] == @spaces[8] && @spaces[0] == @player || \
         @spaces[2] == @spaces[6] && @spaces[2] == @player
        return 4
      end
    end

    if @available_moves.include?(5)
      if @spaces[3] == @spaces[4] && @spaces[3] == @player || \
         @spaces[2] == @spaces[8] && @spaces[2] == @player
        return 5
      end
    end

    if @available_moves.include?(6)
      if @spaces[7] == @spaces[8] && @spaces[7] == @player || \
         @spaces[0] == @spaces[3] && @spaces[0] == @player || \
         @spaces[2] == @spaces[4] && @spaces[2] == @player
        return 6
      end
    end

    if @available_moves.include?(7)
      if @spaces[6] == @spaces[8] && @spaces[6] == @player || \
         @spaces[1] == @spaces[4] && @spaces[1] == @player
        return 7
      end
    end

    if @available_moves.include?(8)
      if @spaces[6] == @spaces[7] && @spaces[6] == @player || \
         @spaces[2] == @spaces[5] && @spaces[2] == @player || \
         @spaces[0] == @spaces[4] && @spaces[0] == @player
        return 8
      end
    end
  end

end
