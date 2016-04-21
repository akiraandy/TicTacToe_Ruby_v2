require 'game_board'

describe GameBoard do
  let(:test_board) { GameBoard.new(3) }

  describe "deep copy " do
    it "makes a deep copy " do
      test_board_2 = test_board.deep_copy
      test_board.spaces[1] = 'X'
      expect(test_board_2.spaces[1]).to eq(' ')
    end
  end

  describe "playing spaces " do
    it "Has 9 spaces for a 3x3 board " do
      expect(test_board.size).to eq(9)
    end

    it "Sets space 4 to 'X' " do
      test_board.spaces[4] = 'X'
      expect(test_board.spaces[4]).to eq('X')
    end

    it "valid_move returns true if a space is open " do
      expect(test_board.valid_move?(4)).to eq(true)
    end

    it "valid_move returns false if a space is taken " do
      test_board.spaces[4] = 'T'
      expect(test_board.valid_move?(4)).to eq(false)
    end
  end

  describe "clearing board, checking full/empty, number of moves free " do

    it "available_moves returns an array of size 9 when board is empty " do
      expect(test_board.available_moves.size).to eq(9)
    end

    it "full? returns true if board is full " do
      test_board.spaces = ["T","T","T","T","T","T","T","T","T"]
      expect(test_board.full?).to eq(true)
    end

    it "full? returns false if board is not full " do
      expect(test_board.full?).to eq(false)
    end

    it "empty? returns true if board is empty " do
      expect(test_board.empty?).to eq(true)
    end

    it "empty? returns false if board is not empty " do
      test_board.spaces[5] = 'T'
      expect(test_board.empty?).to eq(false)
    end
  end

  describe "larger sized boards " do
    let (:board4x4) { GameBoard.new(4) }
    it "size is 16 for a 4x4 board " do
      expect(board4x4.size).to eq(16)
    end
    it "grid_size = 4 in a 4x4 board " do
      expect(board4x4.grid_size).to eq(4)
    end
    it "empty returns true on an empty 4x4 board " do
      expect(board4x4.empty?).to eq(true)
    end
  end
end
