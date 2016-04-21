require 'player'
require 'game_board'
require 'game_state'
require 'game_io'

describe PlayerHuman do
  let(:game_io) { GameIo.new}
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
      allow(game_io.wrapper).to receive(:gets) { "0\n" }
      expect(test_player.play_move(state)).to eq(0)
    end
  end
end
