require 'player_manager'
require 'game_io'
require 'game_board'
require 'player_ai_basic'
require 'player_human'
require 'game_rules'

describe PlayerManager do
  let (:game_io) { double }
  let (:p1) { PlayerAiBasic.new(:X, GameRules.new) }
  let (:p2) { PlayerAiBasic.new(:O, GameRules.new) }
#  let (:test_manager_default) { PlayerManager.new(game_io, ) }
  let (:test_manager) { PlayerManager.new(game_io, p1, p2) }
  let (:test_board) { GameBoard.new }

  describe "Players " do
    describe "switch_turns " do
      it "switch_turns swaps the current_player and non_current_player " do
        p1 = test_manager.current_player
        p2 = test_manager.non_current_player
        test_manager.play_turn(test_board)
        test1 = (p1 == test_manager.non_current_player)
        test2 = (p2 == test_manager.current_player)
        expect(test1 && test2).to eq(true)
      end

      it "After play move the current player has changed " do
        next_player = test_manager.non_current_player
        test_manager.play_turn(test_board)
        expect(next_player == test_manager.current_player).to eq(true)
      end

      it "After play move available_moves.size is 1 less " do
        before_size = test_board.available_moves.size
        test_manager.play_turn(test_board)
        after_size = test_board.available_moves.size
        expect((before_size - 1) == (after_size)).to eq(true)
      end
    end
  end
end
