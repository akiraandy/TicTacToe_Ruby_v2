require 'ai_basic'
require 'game_board'
require 'game_state'

describe Ai_Basic do

  let (:test_ai) { Ai_Basic.new() }
  let (:test_state) { Game_State.new(Game_Board.new , 'X', 'O') }

  describe "playing moves " do
    it "returns 0 (top corner) on empty board " do
      expect(test_ai.play_move(test_state)).to eq(0)
    end

    it "plays winning move if it can " do
      test_state.game_board.spaces[4] = 'X'
      test_state.game_board.spaces[3] = 'X'
      expect(test_ai.play_move(test_state)).to eq(5)
    end

    it "blocks opponent from winning if it can " do
      test_state.game_board.spaces[4] = 'O'
      test_state.game_board.spaces[3] = 'O'
      expect(test_ai.play_move(test_state)).to eq(5)
    end

    it "returns random move when can't win or block " do
      test_state.game_board.spaces[2] = 'O'
      expect(test_ai.play_move(test_state).class).to eq(Fixnum)
    end
  end
end
