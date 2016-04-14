require 'game_board'

describe Game_Board do
  let(:test_board) { Game_Board.new(3) }


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

    it "clears the board " do
      test_board.clear('T')
      expect(test_board.spaces).to eq(["T","T","T","T","T","T","T","T","T"])
    end

    it "available_moves returns an array of size 9 when board is empty " do
      expect(test_board.available_moves.size).to eq(9)
    end

    it "full? returns true if board is full " do
      test_board.clear('T')
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
end
