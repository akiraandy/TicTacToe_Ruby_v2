require 'game_io'
require 'game_board'

describe GameIo do
  let (:test_board) { GameBoard.new(3) }

  describe "printing a board " do
    it "STDOUT a 3x3 game_board " do
      test_board.spaces[1] = 'X'
      test_board.spaces[5] = 'X'
      should_return = "\n-X-\n--X\n---\n"
      expect(STDOUT).to receive(:puts).with(should_return)
      expect(subject.print_board(test_board.spaces, test_board.grid_size)).to eq(should_return)
    end

    it "STDOUT a 5x5 game_board " do
      test_board_5x5 = GameBoard.new(5)
      test_board_5x5.spaces[20] = 'X'
      should_return = "\n-----\n-----\n-----\n-----\nX----\n"
      expect(STDOUT).to receive(:puts).with(should_return)
      expect(subject.print_board(test_board_5x5.spaces, test_board_5x5.grid_size)).to eq(should_return)
    end
  end

  describe "testing puts and print " do
    it "STDOUT should recieve :puts with 'test' " do
      expect(STDOUT).to receive(:puts).with('test')
      subject.puts_message('test')
    end
  end
end
