require 'game_board'
require 'game_rules'

describe Game_Rules do
  let(:test_rules) { Game_Rules.new }
  let(:test_board) { Game_Board.new(3) }

  describe "testing 3 in a row / col " do
    it "check_win_row returns 'X' when 3 in a row " do
      test_board.spaces[6] = 'X'
      test_board.spaces[7] = 'X'
      test_board.spaces[8] = 'X'
      expect(test_rules.check_win_row(test_board)).to eq('X')
    end

    it "check_win_row on 5x5 board " do
      board5x5 = Game_Board.new(5)
      board5x5.spaces[24] = 'X'
      board5x5.spaces[23] = 'X'
      board5x5.spaces[22] = 'X'
      expect(test_rules.check_win_row(board5x5)).to eq('X')
    end

    it "check_win_row returns nil when there is not 3 in a row " do
        expect(test_rules.check_win_row(test_board)).to eq(nil)
    end

    it "check_win_col returns 'X' when 3 in a col " do
      test_board.spaces[2] = 'X'
      test_board.spaces[5] = 'X'
      test_board.spaces[8] = 'X'
      expect(test_rules.check_win_col(test_board)).to eq('X')
    end

    it "check_win_col on 5x5 board " do
      board5x5 = Game_Board.new(5)
      board5x5.spaces[24] = 'X'
      board5x5.spaces[19] = 'X'
      board5x5.spaces[14] = 'X'
      expect(test_rules.check_win_col(board5x5)).to eq('X')
    end

    it "check_win_col returns nil when there is not 3 in a col " do
      expect(test_rules.check_win_col(test_board)).to eq(nil)
    end

    it "check_win_diagonal returns nil when there is no 3 in a row " do
      expect(test_rules.check_win_diagonal(test_board)).to eq(nil)
    end

    it "check_win_diagonal returns 'X' when 3 in a row diagonal down right " do
      test_board.spaces[0] = 'X'
      test_board.spaces[4] = 'X'
      test_board.spaces[8] = 'X'
      expect(test_rules.check_win_diagonal(test_board)).to eq('X')
    end

    it "check_win_diagonal returns 'X' when 3 in a row diagonal down left " do
      test_board.spaces[2] = 'X'
      test_board.spaces[4] = 'X'
      test_board.spaces[6] = 'X'
      expect(test_rules.check_win_diagonal(test_board)).to eq('X')
    end

    it "check_win_diagonal on 5x5 board returns 'X' when 3 in a row diagonal down left " do
      board5x5 = Game_Board.new(5)
      board5x5.spaces[22] = 'X'
      board5x5.spaces[18] = 'X'
      board5x5.spaces[14] = 'X'
      expect(test_rules.check_win_diagonal(board5x5)).to eq('X')
    end
  end

  describe "testing win, lose, tie " do

    it "tied? returns true if the game is tied " do
      test_board.clear('T')
      test_board.spaces[4] = 'X'
      test_board.spaces[0] = 'O'
      test_board.spaces[8] = 'e'
      expect(test_rules.tied?(test_board)).to eq(true)
    end

    it "tied? returns false if game is still happening " do
      expect(test_rules.tied?(test_board)).to eq(false)
    end
  end
end
