require 'tictactoe'

describe TicTacToe do
  let (:game_io) { double }
  let (:player1) { double }
  let (:player2) { double }
  let (:test_ttt) { TicTacToe.new(game_io, player1, player2) }

  it "runs the main loop " do
    expect(test_ttt.game_loop).to receive(:game_loop).once
    expect(game_io).to receive(:puts_message)
    expect(game_io).to receive(:get_input).and_return("N")
    test_ttt.play_game
  end

  it "plays the game twice " do
    expect(test_ttt.game_loop).to receive(:game_loop).twice
    allow(test_ttt).to receive(:new_game)
    expect(game_io).to receive(:puts_message).twice
    expect(game_io).to receive(:get_input).and_return("Y", "N")
    test_ttt.play_game
  end

  it "gameboad is blank after new_game " do
    expect(test_ttt.game_loop).to receive(:game_loop).twice
    expect(test_ttt).to receive(:play_again?).and_return(true, false)
    test_ttt.board.spaces[0] = 'X'
    test_ttt.play_game
    expect(test_ttt.board.spaces[0]).to eq(' ')
  end
end
