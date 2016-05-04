require 'ai_basic'
require 'game_board'
require 'game_state'
require 'game_rules'

describe AiBasic do
  let (:board) { GameBoard.new }
  let (:rules) { GameRules.new }

  let (:test_ai) { AiBasic.new( rules) }
  let (:test_ai2) { AiBasic.new( rules) }
  let (:test_state) { GameState.new(board , :X, :O) }
  let(:spaces) { test_state.game_board.spaces }
  let(:corners) { [0, 2, 6, 8] }

  describe "Plays a corner " do
    it "returns a corner on empty board " do
      test_for_true = corners.include?(test_ai.get_move(test_state))
      expect(test_for_true).to eq(true)
    end

    it "returns a corner if only move played so far is center " do
      spaces[4] = :O
      test_for_true = corners.include?(test_ai.get_move(test_state))
      expect(test_for_true).to eq(true)
    end
  end

  describe "playing a random move " do
    it "plays a radnom move if it can't win, block, or play a corner " do
      spaces[0] = spaces[5] = spaces[6] = spaces[7] = :X
      spaces[2] = spaces[3] = spaces[8] = :O
      move = test_ai2.get_move(test_state)
      expect(move.class).to eq(Fixnum)
    end
  end

  describe "plays winning move if it can " do

    it "returns 0 if 1 and 2 are :X " do
      spaces[1] = spaces[2] = :X
      expect(test_ai.get_move(test_state)).to eq(0)
    end

    it "returns 0 if 3 and 6 are :X " do
      spaces[3] = spaces[6] = :X
      expect(test_ai.get_move(test_state)).to eq(0)
    end

    it "returns 1 if 0 and 2 are :X " do
      spaces[0] = spaces[2] = :X
      expect(test_ai.get_move(test_state)).to eq(1)
    end

    it "returns 1 if 4 and 7 are :X " do
      spaces[4] = spaces[7] = :X
      expect(test_ai.get_move(test_state)).to eq(1)
    end

    it "returns 2 if 0 and 1 are :X " do
      spaces[0] = spaces[1] = :X
      expect(test_ai.get_move(test_state)).to eq(2)
    end

    it "returns 2 if 5 and 8 are :X " do
      spaces[5] = spaces[8] = :X
      expect(test_ai.get_move(test_state)).to eq(2)
    end

    it "returns 3 if 4 and 5 are :X " do
      spaces[4] = spaces[5] = :X
      expect(test_ai.get_move(test_state)).to eq(3)
    end

    it "returns 3 if 0 and 6 are :X " do
      spaces[0] = spaces[6] = :X
      expect(test_ai.get_move(test_state)).to eq(3)
    end

    it "returns 4 if 3 and 5 and :X " do
      spaces[3] = spaces[5] = :X
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 4 if 1 and 7 and :X " do
      spaces[1] = spaces[7] = :X
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 5 if 3 and 4 and :X " do
      spaces[3] = spaces[4] = :X
      expect(test_ai.get_move(test_state)).to eq(5)
    end

    it "returns 5 if 2 and 8 and :X " do
      spaces[2] = spaces[8] = :X
      expect(test_ai.get_move(test_state)).to eq(5)
    end

    it "returns 6 if 7 and 8 and :X " do
      spaces[7] = spaces[8] = :X
      expect(test_ai.get_move(test_state)).to eq(6)
    end

    it "returns 6 if 0 and 3 and :X " do
      spaces[0] = spaces[3] = :X
      expect(test_ai.get_move(test_state)).to eq(6)
    end

    it "returns 7 if 6 and 8 and :X " do
      spaces[6] = spaces[8] = :X
      expect(test_ai.get_move(test_state)).to eq(7)
    end

    it "returns 7 if 1 and 4 and :X " do
      spaces[1] = spaces[4] = :X
      expect(test_ai.get_move(test_state)).to eq(7)
    end

    it "returns 8 if 6 and 7 and :X " do
      spaces[6] = spaces[7] = :X
      expect(test_ai.get_move(test_state)).to eq(8)
    end

    it "returns 8 if 2 and 5 and :X " do
      spaces[2] = spaces[5] = :X
      expect(test_ai.get_move(test_state)).to eq(8)
    end

    it "returns 0 if 4 and 8 are :X " do
      spaces[4] = spaces[8] = :X
      expect(test_ai.get_move(test_state)).to eq(0)
    end

    it "returns 2 if 4 and 6 are :X " do
      spaces[4] = spaces[6] = :X
      expect(test_ai.get_move(test_state)).to eq(2)
    end

    it "returns 4 if 0 and 8 are :X " do
      spaces[0] = spaces[8] = :X
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 2 if 0 and 6 are :X " do
      spaces[2] = spaces[6] = :X
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 6 if 2 and 4 are :X " do
      spaces[2] = spaces[4] = :X
      expect(test_ai.get_move(test_state)).to eq(6)
    end

    it "returns 8 if 0 and 4 are :X " do
      spaces[0] = spaces[4] = :X
      expect(test_ai.get_move(test_state)).to eq(8)
    end
  end

  describe "plays blocking move if it can " do

    it "returns 0 if 1 and 2 are :X " do
      spaces[1] = spaces[2] = :O
      expect(test_ai.get_move(test_state)).to eq(0)
    end

    it "returns 0 if 3 and 6 are :X " do
      spaces[3] = spaces[6] = :O
      expect(test_ai.get_move(test_state)).to eq(0)
    end

    it "returns 1 if 0 and 2 are :X " do
      spaces[0] = spaces[2] = :O
      expect(test_ai.get_move(test_state)).to eq(1)
    end

    it "returns 1 if 4 and 7 are :X " do
      spaces[4] = spaces[7] = :O
      expect(test_ai.get_move(test_state)).to eq(1)
    end

    it "returns 2 if 0 and 1 are :X " do
      spaces[0] = spaces[1] = :O
      expect(test_ai.get_move(test_state)).to eq(2)
    end

    it "returns 2 if 5 and 8 are :X " do
      spaces[5] = spaces[8] = :O
      expect(test_ai.get_move(test_state)).to eq(2)
    end

    it "returns 3 if 4 and 5 are :X " do
      spaces[4] = spaces[5] = :O
      expect(test_ai.get_move(test_state)).to eq(3)
    end

    it "returns 3 if 0 and 6 are :X " do
      spaces[0] = spaces[6] = :O
      expect(test_ai.get_move(test_state)).to eq(3)
    end

    it "returns 4 if 3 and 5 and :X " do
      spaces[3] = spaces[5] = :O
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 4 if 1 and 7 and :X " do
      spaces[1] = spaces[7] = :O
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 5 if 3 and 4 and :X " do
      spaces[3] = spaces[4] = :O
      expect(test_ai.get_move(test_state)).to eq(5)
    end

    it "returns 5 if 2 and 8 and :X " do
      spaces[2] = spaces[8] = :O
      expect(test_ai.get_move(test_state)).to eq(5)
    end

    it "returns 6 if 7 and 8 and :X " do
      spaces[7] = spaces[8] = :O
      expect(test_ai.get_move(test_state)).to eq(6)
    end

    it "returns 6 if 0 and 3 and :X " do
      spaces[0] = spaces[3] = :O
      expect(test_ai.get_move(test_state)).to eq(6)
    end

    it "returns 7 if 6 and 8 and :X " do
      spaces[6] = spaces[8] = :O
      expect(test_ai.get_move(test_state)).to eq(7)
    end

    it "returns 7 if 1 and 4 and :X " do
      spaces[1] = spaces[4] = :O
      expect(test_ai.get_move(test_state)).to eq(7)
    end

    it "returns 8 if 6 and 7 and :X " do
      spaces[6] = spaces[7] = :O
      expect(test_ai.get_move(test_state)).to eq(8)
    end

    it "returns 8 if 2 and 5 and :X " do
      spaces[2] = spaces[5] = :O
      expect(test_ai.get_move(test_state)).to eq(8)
    end

    it "returns 0 if 4 and 8 are :X " do
      spaces[4] = spaces[8] = :O
      expect(test_ai.get_move(test_state)).to eq(0)
    end

    it "returns 2 if 4 and 6 are :X " do
      spaces[4] = spaces[6] = :O
      expect(test_ai.get_move(test_state)).to eq(2)
    end

    it "returns 4 if 0 and 8 are :X " do
      spaces[0] = spaces[8] = :O
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 2 if 0 and 6 are :X " do
      spaces[2] = spaces[6] = :O
      expect(test_ai.get_move(test_state)).to eq(4)
    end

    it "returns 6 if 2 and 4 are :X " do
      spaces[2] = spaces[4] = :O
      expect(test_ai.get_move(test_state)).to eq(6)
    end

    it "returns 8 if 0 and 4 are :X " do
      spaces[0] = spaces[4] = :O
      expect(test_ai.get_move(test_state)).to eq(8)
    end
  end
end
