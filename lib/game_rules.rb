require 'game_board'

class Game_Rules

  def tied?(game_board)
    if game_board.full? && !winner?(game_board)
      return true
    end
    false
  end

  def winner?(game_board)
    return check_win_row(game_board) if check_win_row(game_board)
    return check_win_col(game_board) if check_win_col(game_board)
    return check_win_diagonal(game_board) if check_win_diagonal(game_board)
  end

  def check_win_row(game_board)
    current_row = 1
    current_space = 0
    begin
      begin
        if game_board.spaces[current_space] == game_board.spaces[current_space + 1] && \
          game_board.spaces[current_space] == game_board.spaces[current_space + 2] && \
          !game_board.valid_move?(current_space)
         return game_board.spaces[current_space]
        end
        current_space += 1
      end while current_space + 2 < game_board.grid_size * current_row
      current_row += 1
      current_space = (current_row - 1) * game_board.grid_size
    end while current_row <= game_board.grid_size
  end

  def check_win_col(game_board)
    current_col = 1
    current_space = 0
    col_size = game_board.grid_size
    begin
      begin
        if game_board.spaces[current_space] == game_board.spaces[current_space + col_size] && \
          game_board.spaces[current_space] == game_board.spaces[current_space + (2 * col_size)] && \
          !game_board.valid_move?(current_space)
          return game_board.spaces[current_space]
         end
        current_space += col_size
      end while current_space + 2 < col_size * current_col
      current_col += 1
      current_space = current_col - 1
    end while current_col <= col_size
  end

  def check_win_diagonal(game_board)
    grid_size = game_board.grid_size
    for current_row in 0..(game_board.grid_size - 3)
      for current_col in 0..(game_board.grid_size - 1)
        current_space = current_row * grid_size + current_col
        if current_col >= 2
          return game_board.spaces[current_space] if check_win_diagonal_left(game_board, current_space)
        end
        if current_col < grid_size - 2
          return game_board.spaces[current_space] if check_win_diagonal_right(game_board, current_space)
        end
      end
    end
    nil
  end

  def check_win_diagonal_left(game_board, space)
    offset = game_board.grid_size - 1
    if game_board.spaces[space] == game_board.spaces[space + offset] && \
       game_board.spaces[space] == game_board.spaces[space + offset + offset] && \
       !game_board.valid_move?(space)
      return true
    end
  end

  def check_win_diagonal_right(game_board, space)
    offset = game_board.grid_size + 1
    if game_board.spaces[space] == game_board.spaces[space + offset] && \
       game_board.spaces[space] == game_board.spaces[space + offset + offset] && \
       !game_board.valid_move?(space)
      return true
    end
  end
end
