require 'tictactoe'
require 'player'
require 'game_io'

describe TicTacToe do
  let (:ttt) { TicTacToe.new }
  let (:io) { GameIo.new }
  let (:p1) { PlayerAiBasic.new('X', io) }
  let (:p2) { PlayerAiBasic.new('O', io) }
  let (:ttt_2) { TicTacToe.new(p1, p2)}

  describe "The Game Loop " do
    it "Should complete the game loop " do
      expect(ttt_2.game_loop).to eq(true)
    end
  end

  describe "Printing end of game " do
    it "Prints tied game when the game is tied " do
      ttt.board.spaces = ['X', 'O', "A", "b", "c", "d", "e", "f", "g"]
      should_return = "The Game Ended in a Tie!\n"
      expect(STDOUT).to receive(:puts).with(should_return)
      expect(ttt.print_end_of_game).to eq(true)
    end

    it "Prints 'X' if the winner if 'X' winds " do
      ttt.board.spaces = ['X', 'X', "X", "b", "c", "d", "e", "f", "g"]
      should_return = "The Winner is X!\n"
      expect(STDOUT).to receive(:puts).with(should_return)
      expect(ttt.print_end_of_game).to eq(true)
    end

    it "Prints nothing if game is still going on " do
      expect(ttt.print_end_of_game).to eq(false)
    end
  end

  describe "Printing the game screeen " do
    it "Should print Tic Tac Toe and a blank board, if no moves have been played " do
      should_return1 = "\n Legend "
      should_return2 = "\n012\n345\n678\n"
      should_return3 = "\n Tic Tac Toe "
      should_return4 = "\n---\n---\n---\n"
      expect(STDOUT).to receive(:puts).with(should_return1)
      expect(STDOUT).to receive(:puts).with(should_return2)
      expect(STDOUT).to receive(:puts).with(should_return3)
      expect(STDOUT).to receive(:puts).with(should_return4)
      ttt.print_screen
    end
  end
end
