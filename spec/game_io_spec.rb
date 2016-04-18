require 'game_io'
require 'game_board'

describe GameIo do
  let (:test_board) { GameBoard.new(3) }

  describe "printing a board " do
    it "STDOUT a 3x3 game_board " do
      test_board.spaces[1] = 'X'
      test_board.spaces[5] = 'X'
      expect(subject.print_board(test_board.spaces, test_board.grid_size)).to eq("\n-X-\n--X\n---\n")
    end

    it "STDOUT a 5x5 game_board " do
      test_board_5x5 = GameBoard.new(5)
      test_board_5x5.spaces[20] = 'X'
      should_return = "\n-----\n-----\n-----\n-----\nX----\n"
      expect(subject.print_board(test_board_5x5.spaces, test_board_5x5.grid_size)).to eq(should_return)
    end
  end
end
