require 'tictactoe'

describe TicTacToe do
  let (:game_io) { double }
  let (:player1) { double }
  let (:player2) { double }
  let (:test_ttt) { TicTacToe.new(game_io, player1, player2) }

  it "runs the game loop " do
    expect(test_ttt.game_loop).to receive(:game_loop).once
    expect(test_ttt).to receive(:play_again?).and_return(false)
    test_ttt.play_game
  end

  describe "the play_again? method " do
    it "returns true if user says yes " do
      allow(game_io).to receive(:puts_message)
      allow(game_io).to receive(:get_input).and_return("Y")
      expect(test_ttt.play_again?).to eq(true)
    end

    it "returns false if user says no " do
      allow(game_io).to receive(:puts_message)
      allow(game_io).to receive(:get_input).and_return("N")
      expect(test_ttt.play_again?).to eq(false)
    end
  end
end
