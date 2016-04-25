require 'tictactoe'

describe TicTacToe do
  let (:game_io) { double }
  let (:player1) { double }
  let (:player2) { double }
  let (:test_ttt) { TicTacToe.new(game_io, player1, player2) }

  it "runs the game loop " do
    allow(test_ttt.game_loop).to receive(:game_loop) { }
    test_ttt.game_loop
  end
end
