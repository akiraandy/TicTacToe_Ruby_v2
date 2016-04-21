require 'game_board'

class GameRules

  def initialize (game_board)
    @board = game_board
  end

  def game_status
    return winner if winner
    return :tied if tied?
    return :playing
  end

  def tied?
    @board.full? && !winner
  end

  def winner
    check_win_col || check_win_row || check_win_diagonal
#    return check_win_col if check_win_col
#    return check_win_row if check_win_row
#    return check_win_diagonal if check_win_diagonal
#    false
  end

private

  def check_win_col
    spaces = @board.spaces
    return spaces[0] if [spaces[0], spaces[3], spaces[6]].uniq.length == 1 && \
      spaces[0] != ' '
    return spaces[1] if [spaces[1], spaces[4], spaces[7]].uniq.length == 1 && \
      spaces[1] != ' '
    return spaces[2] if [spaces[2], spaces[5], spaces[8]].uniq.length == 1 && \
      spaces[2] != ' '
    false
  end

  def check_win_row
    spaces = @board.spaces
    return spaces[0] if [spaces[0], spaces[1], spaces[2]].uniq.length == 1 && \
      spaces[0] != ' '
    return spaces[3] if [spaces[3], spaces[4], spaces[5]].uniq.length == 1 && \
      spaces[3] != ' '
    return spaces[6] if [spaces[6], spaces[7], spaces[8]].uniq.length == 1 && \
      spaces[6] != ' '
    false
  end

  def check_win_diagonal
    spaces = @board.spaces
    return spaces[4] if [spaces[0], spaces[4], spaces[8]].uniq.length == 1 && \
      spaces[4] != ' '
    return spaces[4] if [spaces[6], spaces[4], spaces[2]].uniq.length == 1 && \
      spaces[4] != ' '
    false
  end
end
