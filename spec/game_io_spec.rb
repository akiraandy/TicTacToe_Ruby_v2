require 'game_io'
require 'game_board'

describe GameIo do
  let (:test_board) { GameBoard.new(3) }
  let (:test_wrapper) { "dummy" }
  let (:test_io) { GameIo.new(test_wrapper) }

  describe "printing a board " do
    it "STDOUT a 3x3 game_board " do
      test_board.spaces[1] = :X
      test_board.spaces[5] = :X
      should_return = "\n-X-\n--X\n---\n"
      allow(test_wrapper).to receive(:puts_message) { should_return }
      expect(test_io.print_board(test_board.spaces, test_board.grid_size)).to eq(should_return)
    end

    it "STDOUT a 5x5 game_board " do
      test_board_5x5 = GameBoard.new(5)
      test_board_5x5.spaces[20] = :X
      should_return = "\n-----\n-----\n-----\n-----\nX----\n"
      allow(test_wrapper).to receive(:puts_message) { should_return }
      expect(test_io.print_board(test_board_5x5.spaces, test_board_5x5.grid_size)).to eq(should_return)
    end
  end

  describe "testing puts and print " do
    it "STDOUT should recieve :puts with 'test' " do
      allow(test_wrapper).to receive(:puts_message) { 'test' }
      test_io.puts_message('test')
    end
  end
end
