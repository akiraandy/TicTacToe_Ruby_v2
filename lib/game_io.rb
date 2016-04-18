
class GameIo

  def print_board(spaces, grid_size)
    rtn_string = "\n"
    spaces.each.with_index do |val, i|
      if val == ' '
        rtn_string << '-'
      else
        rtn_string << val
      end
      rtn_string << "\n" if ((i + 1) % grid_size == 0)
    end
    puts rtn_string
    rtn_string
  end

  def clear_screen
    system("clear")
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
