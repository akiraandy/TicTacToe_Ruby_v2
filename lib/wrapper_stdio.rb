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
