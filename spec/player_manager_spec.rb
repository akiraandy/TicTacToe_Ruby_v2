require 'player_manager'
require 'game_io'
require 'game_board'
require 'player_ai_basic'
require 'player_human'


describe PlayerManager do
  let (:game_io) { "dummy" }
  let (:p1) { PlayerAiBasic.new(:X) }
  let (:p2) { PlayerAiBasic.new(:O) }
  let (:test_manager_default) { PlayerManager.new(game_io) }
  let (:test_manager) { PlayerManager.new(game_io, p1, p2) }
  let (:test_board) { GameBoard.new }

  describe "initialize method " do
    it "player1.mark is :X if no member passed in " do
      expect(test_manager_default.current_player.mark).to eq(:X)
    end

    it "player2.mark is :O if no member passed in " do
      expect(test_manager_default.non_current_player.mark).to eq(:O)
    end

    it "player1.type is :Human if no member passed in " do
      expect(test_manager_default.current_player.class).to eq(PlayerHuman)
    end

    it "player2.type is :AiBasic if no member passed in " do
      expect(test_manager_default.non_current_player.class).to eq(PlayerAiBasic)
    end

  end

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
