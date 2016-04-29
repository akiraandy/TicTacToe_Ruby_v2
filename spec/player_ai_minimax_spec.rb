require 'player_ai_minimax'
require 'game_board'
require 'game_state'
require 'game_rules'


describe PlayerAiMinimax do
  let (:io) { double }
  let (:board) { GameBoard.new }
  let (:rules) { GameRules.new }

  let (:test_ai) { PlayerAiMinimax.new(:X, rules) }
  let (:test_ai2) { PlayerAiMinimax.new(:O, rules) }
  let (:test_state) { GameState.new(board , :X, :O) }
  let(:spaces) { test_state.game_board.spaces }
  let(:corners) { [0, 2, 6, 8] }


  describe "It has a mark " do
    it ".mark returns :X " do
      expect(test_ai.mark).to eq(:X)

    end
  end
  
  describe "Playing the last move " do
    it "plays 0 when that is the only space open " do
      [1,2,3,4,5,6,7,8].each do |i|
        spaces[i] = i
      end
      expect(test_ai.play_move(test_state)).to eq(0)
    end
    it "plays 1 when that is the only space open " do
      [0,2,3,4,5,6,7,8].each do |i|
        spaces[i] = i
      end
      expect(test_ai.play_move(test_state)).to eq(1)
    end
  end

  describe "Playing second to last move " do
    it "when only 7 and 8 are left it plays 7 when that will block opponent and 8 will not " do
      [1,2,3,4].each do |i|
        spaces[i] = :X
      end
      [0,5,6].each do |i|
        spaces[i] = :O
      end
      expect(test_ai.play_move(test_state)).to eq(7)
    end

    it "when only 6 and 7 are left it plays 7 and neither move wins / blocks " do
      [1,2,3,8].each do |i|
        spaces[i] = :X
      end
      [0,4,5].each do |i|
        spaces[i] = :O
      end
      expect(test_ai.play_move(test_state)).to eq(7)
    end

    it "when only 1 and 2 are left it plays 2 and neither move wins / blocks " do
      [0,4,5,6].each do |i|
        spaces[i] = :X
      end
      [3,7,8].each do |i|
        spaces[i] = :O
      end
      expect(test_ai.play_move(test_state)).to eq(2)
    end
  end

  describe "When it goes first " do
    it "plays 0 on empty board " do
      expect(test_ai.play_move(test_state)).to eq(0)
    end
  end

  describe "When it goes second " do
    it "plays center square if other player played a corner 0" do
      spaces[0] = :O
      expect(test_ai.play_move(test_state)).to eq(4)
    end

    it "plays center square if other player played a corner 2" do
      spaces[2] = :O
      expect(test_ai.play_move(test_state)).to eq(4)
    end

    it "plays center square if other player played a corner 6" do
      spaces[6] = :O
      expect(test_ai.play_move(test_state)).to eq(4)
    end

    it "plays center square if other player played a corner 8" do
      spaces[8] = :O
      expect(test_ai.play_move(test_state)).to eq(4)
    end
  end

  describe "Creating a Fork " do
    it "plays 2 to create a fork " do
      [0,6].each do |i|
        spaces[i] = :X
      end
      [8,3].each do |i|
        spaces[i] = :O
      end
      expect(test_ai.play_move(test_state)).to eq(2)
    end
  end
end
