require 'game_board'
require 'game_rules'

describe GameRules do

  let(:test_board) { GameBoard.new(3) }
  let(:test_rules) { GameRules.new(test_board) }

  describe "game_status " do
    it "game_status returns :playing when playing " do
      expect(test_rules.game_status).to eq(:playing)
    end

    it "game_status returns :tied when game is tied " do
      test_board.clear('T')
      test_board.spaces[4] = 'X'
      test_board.spaces[0] = 'O'
      test_board.spaces[8] = 'e'
      expect(test_rules.game_status).to eq(:tied)
    end
  end

  describe "testing winner " do
    it "Returns false when there is no winner " do
      expect(test_rules.winner).to eq(false)
    end
    it "Returns 'X' if player x has 3 in first col " do
      test_board.spaces[0] = 'X'
      test_board.spaces[3] = 'X'
      test_board.spaces[6] = 'X'
      expect(test_rules.winner).to eq('X')
    end

    it "Returns 'X' if player x has 3 in second col " do
      test_board.spaces[1] = 'X'
      test_board.spaces[4] = 'X'
      test_board.spaces[7] = 'X'
      expect(test_rules.winner).to eq('X')
    end

    it "Returns 'X' if player x has 3 in third col " do
      test_board.spaces[2] = 'X'
      test_board.spaces[5] = 'X'
      test_board.spaces[8] = 'X'
      expect(test_rules.winner).to eq('X')
    end

    it "Returns 'X' if player x has 3 in first row " do
      test_board.spaces[0] = 'X'
      test_board.spaces[1] = 'X'
      test_board.spaces[2] = 'X'
      expect(test_rules.winner).to eq('X')
    end

    it "Returns 'X' if player x has 3 in second row " do
      test_board.spaces[3] = 'X'
      test_board.spaces[4] = 'X'
      test_board.spaces[5] = 'X'
      expect(test_rules.winner).to eq('X')
    end

    it "Returns 'X' if player x has 3 in thrid row " do
      test_board.spaces[6] = 'X'
      test_board.spaces[7] = 'X'
      test_board.spaces[8] = 'X'
      expect(test_rules.winner).to eq('X')
    end

    it "Returns 'X' if player x has 3 diagonal desending " do
      test_board.spaces[0] = test_board.spaces[4] = test_board.spaces[8] = 'X'
      expect(test_rules.winner).to eq('X')
    end

    it "Returns 'X' if player x has 3 diagonal ascending " do
      test_board.spaces[6] = test_board.spaces[4] = test_board.spaces[2] = 'X'
      expect(test_rules.winner).to eq('X')
    end
  end

  describe "testing tie? " do

    it "tied? returns true if the game is tied " do
      test_board.clear('T')
      test_board.spaces[4] = 'X'
      test_board.spaces[0] = 'O'
      test_board.spaces[8] = 'e'
      expect(test_rules.tied?).to eq(true)
    end

    it "tied? returns false if game is still happening " do
      expect(test_rules.tied?).to eq(false)
    end
  end
end
