require 'tictactoe'
require 'player_human'
require 'player_ai_basic'
require 'game_io'
require 'wrapper_stdio'
require 'game_board'
require 'game_screen'

describe GameScreen do
  let (:test_wrapper) { "dummy" }
  let (:io) { GameIo.new(test_wrapper) }
  let (:board) { GameBoard.new }
  let (:p1) { PlayerAiBasic.new('X', io) }
  let (:p2) { PlayerAiBasic.new('O', io) }
  let (:players1) { PlayerManager.new(p1, p2) }
  let (:rules) { GameRules.new (board) }
  let (:legend) { ['0', '1', '2', '3', '4', '5', '6', '7', '8'] }
  let (:legend_size)  { 3 }


  let (:test_screen) {GameScreen.new(io, board, players1, rules, legend, legend_size)}

  describe "Printing end of game " do
    it "Prints tied game when the game is tied " do
      board.spaces = ['X', 'O', "A", "b", "c", "d", "e", "f", "g"]
      should_return = "The Game Ended in a Tie!\n"
      allow(io).to receive(:puts_message) { should_return }
      expect(test_screen.print_end_of_game).to eq(should_return)
    end

    it "Prints 'X' if the winner if 'X' wins " do
      board.spaces = ['X', 'X', "X", "b", "c", "d", "e", "f", "g"]
      should_return = "The Winner is X!\n"
      allow(io).to receive(:puts_message) { should_return }
      expect(test_screen.print_end_of_game).to eq(should_return)

    end

    it "Prints nothing if game is still going on " do
      expect(test_screen.print_end_of_game).to eq(nil)
    end
  end
end
