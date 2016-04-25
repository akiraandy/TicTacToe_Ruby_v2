require 'player_human'
require 'game_board'
require 'game_state'
require 'game_io'



describe PlayerHuman do
  let(:game_io) { "dummy" }
  let(:test_player) { PlayerHuman.new(:X, game_io) }
  let(:test_player2) { PlayerHuman.new(:O, game_io) }
  let(:board) { GameBoard.new }

  it "mark should retrun 'X' if that was passed in for consturctor " do
    expect(test_player.mark).to eq(:X)
  end

  it "type should return 'Human' for human player " do
    expect(test_player.class).to eq(PlayerHuman)
  end

  describe "play_move returns valid moves " do

    it "accpets 0 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "0" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(0)
    end

    it "accpets 1 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "1" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(1)
    end

    it "accpets 2 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "2" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(2)
    end

    it "accpets 3 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "3" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(3)
    end

    it "accpets 4 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "4" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(4)
    end

    it "accpets 5 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "5" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(5)
    end

    it "accpets 6 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "6" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(6)
    end

    it "accpets 7 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "7" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(7)
    end

    it "accpets 8 when that is a valid move " do
      state = GameState.new(board, test_player, test_player2)
      allow(game_io).to receive(:get_input) { "8" }
      allow(game_io).to receive(:puts_message) { }
      expect(test_player.play_move(state)).to eq(8)
    end

  end
end
