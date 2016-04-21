
class GameIo

  attr_reader :wrapper

  def initialize
    @wrapper = WrapperStdio.new
  end
  def print_board(spaces, grid_size)
    rtn_string = "\n"
    spaces.each.with_index do |val, i|
      if val == ' '
        rtn_string << '-'
      else
        rtn_string << val.to_s
      end
      rtn_string << "\n" if ((i + 1) % grid_size == 0)
    end
    @wrapper.puts_message(rtn_string)
    rtn_string
  end

  def clear_screen
    @wrapper.clear_screen
  end

  def puts_message(puts_string)
    @wrapper.puts_message(puts_string)
  end

  def get_input
    @wrapper.get_input
  end
end

class WrapperStdio
  def clear_screen
    system("clear")
  end

  def puts_message(puts_string)
    puts puts_string
  end

  def get_input
    gets.chomp
  end
end
