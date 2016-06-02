class GameRules

  def tied?(board)
    board.full? && !winner(board)
  end

  def game_over?(board)
    tied?(board) || !!(winner(board))
  end
  
  def winner(board)
    check_win_col(board.spaces) || check_win_row(board.spaces) || check_win_diagonal(board.spaces)
  end

private

  def check_win_col(spaces)
    [0,1,2].each do |i|
    return spaces[i] if [spaces[i], spaces[i + 3], spaces[i + 6]].uniq.length == 1 && \
      spaces[i] != ' '
    end
    nil
  end

  def check_win_row(spaces)
    [0, 3, 6].each do |i|
    return spaces[i] if [spaces[i], spaces[i + 1], spaces[i + 2]].uniq.length == 1 && \
      spaces[i] != ' '
    end
    nil
  end

  def check_win_diagonal(spaces)
    return spaces[4] if [spaces[0], spaces[4], spaces[8]].uniq.length == 1 && \
      spaces[4] != ' '
    return spaces[4] if [spaces[6], spaces[4], spaces[2]].uniq.length == 1 && \
      spaces[4] != ' '
  end
end
