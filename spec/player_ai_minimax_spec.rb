require 'player_ai_minimax'
require 'game_board'
require 'game_state'
require 'game_rules'


describe PlayerAiMinimax do
  let (:io) { double }
  let (:board) { GameBoard.new }
  let (:rules) { GameRules.new }

  let (:test_ai) { PlayerAiMinimax.new(:O, rules) }
  let (:test_ai2) { PlayerAiMinimax.new(:X, rules) }
  let (:test_state) { GameState.new(board , :X, :O) }
  let(:spaces) { test_state.game_board.spaces }
  let(:corners) { [0, 2, 6, 8] }


  describe "It has a mark " do
    it ".mark returns :O " do
      expect(test_ai.mark).to eq(:O)    

    end
  end
  
  describe "Playing a move " do
    it "plays 0 when that is the only space open " do
      [1,2,3,4,5,6,7,8].each do |i|
        spaces[i] = :T
      end
      expect(test_ai.play_move(test_state)).to eq(0)
    end
    it "plays 1 when that is the only space open " do
      [0,2,3,4,5,6,7,8].each do |i|
        spaces[i] = :T
      end
      expect(test_ai.play_move(test_state)).to eq(1)
    end
 
  end


end
