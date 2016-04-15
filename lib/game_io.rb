require 'game_board'
class Game_Io

  def print_board(spaces, grid_size)
    rtn_string = "\n"
    spaces.each.with_index do |val, i|
      rtn_string << val
      rtn_string << "\n" if ((i + 1) % grid_size == 0)
    end
    rtn_string
  end

  def print_message(print_string)
    print print_string
  end

  def puts_message(puts_string)
    puts puts_string
  end

  def get_input
    gets.chomp
  end
end
