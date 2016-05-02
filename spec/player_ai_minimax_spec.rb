require 'player_ai_minimax'
require 'game_board'
require 'game_state'
require 'game_rules'

describe PlayerAiMinimax do
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
      (1..8).each do |i|
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
    it "it will play to block if the other move doesn't block or win." do
      set_spaces(:X, [1,2,3,4])
      set_spaces(:O, [0,5,6])
      expect(test_ai.play_move(test_state)).to eq(7)
    end

    it "when only 6 and 7 are left it plays 7 and neither move wins / blocks " do
      set_spaces(:X, [1,2,3,8])
      set_spaces(:O, [0,4,5])
      expect(test_ai.play_move(test_state)).to eq(7)
    end

    it "when only 1 and 2 are left it plays 2 and neither move wins / blocks " do
      set_spaces(:X, [0,4,5,6])
      set_spaces(:O, [3,7,8])
      expect(test_ai.play_move(test_state)).to eq(2)
    end
  end

  describe "When it goes first " do
    it "plays 0 on empty board " do
      expect(test_ai.play_move(test_state)).to eq(0)
    end
  end

  describe "When it goes second " do
    describe "Player 1 played a corner " do
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

    describe "Player 1 played center " do
      it "returns a corner move " do
        set_spaces(:O, [4])
        move = test_ai.play_move(test_state)
        expect(corners.include?(move)).to eq(true)
      end
    end 

    describe "Player 1 played a side " do
      it "returns a cornver move if player1 played 1 " do
        set_spaces(:O, [1])
        move = test_ai.play_move(test_state)
        expect(corners.include?(move)).to eq(true)
      end

      it "returns a cornver move if player1 played 3 " do
        set_spaces(:O, [3])
        move = test_ai.play_move(test_state)
        expect(corners.include?(move)).to eq(true)
      end

      it "returns a cornver move if player1 played 5 " do
        set_spaces(:O, [5])
        move = test_ai.play_move(test_state)
        expect(corners.include?(move)).to eq(true)
      end

      it "returns a cornver move if player1 played 7 " do
        set_spaces(:O, [7])
        move = test_ai.play_move(test_state)
        expect(corners.include?(move)).to eq(true)
      end


    end
  end

  describe "Creating a Fork " do
    it "plays 2 to create a fork " do
     set_spaces(:X, [0, 6])
     set_spaces(:O, [3, 8])
     expect(test_ai.play_move(test_state)).to eq(2)
    end
  end
  
  def set_spaces(mark, spaces_to_set)
    spaces_to_set.each { |i| spaces[i] = mark }
  end  
end
