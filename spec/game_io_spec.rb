require 'game_io'
require 'game_board'

class MockWrapperStdio
  attr_accessor :rtn_get_input, :puts_string
  def clear_screen
  end

  def puts_message(puts_string)
    puts_string    
  end

  def get_input
    rtn_get_input
  end
end


describe GameIo do
  let (:test_board) { GameBoard.new(3) }
  let (:test_wrapper) { MockWrapperStdio.new }
  let (:test_io) { GameIo.new(test_wrapper) }

  describe "printing a board " do
    it "STDOUT a 3x3 game_board " do
      test_board.spaces[1] = :X
      test_board.spaces[5] = :X
      should_return = "\n-X-\n--X\n---\n"
      test_wrapper.puts_string = should_return
      actual_return = test_io.print_board(test_board.spaces, test_board.grid_size)
     
      expect(actual_return).to eq(should_return)
    end

    it "STDOUT a 5x5 game_board " do
      test_board_5x5 = GameBoard.new(5)
      test_board_5x5.spaces[20] = :X
      should_return = "\n-----\n-----\n-----\n-----\nX----\n"
      expect(test_io.print_board(test_board_5x5.spaces, test_board_5x5.grid_size)).to eq(should_return)
    end
  end

  describe "testing puts and print " do
    it "STDOUT should recieve :puts with 'test' " do
      test_io.puts_message('test')
    end
  end
end
