require 'tictactoe'
require 'game_rules'

describe TicTacToe do
  let(:rules) { double }
  let(:board) { double }
  let(:test_ttt) { TicTacToe.new(rules, board) }

  describe "boolean methods : game_over? tied? valid_move?" do
    it "returns false when game is not over" do
      expect(rules).to receive(:game_over?)
      test_ttt.game_over?
    end

    it "tied? calls rules.tied?" do
      expect(rules).to receive(:tied?)
      test_ttt.tied_game?
    end

    it "valid_move? calls board.valid_move?" do
      expect(board).to receive(:valid_move?).with(0)
      test_ttt.valid_move?(0)
    end
  end

  describe "Getting the winner" do
    it "winner calls rules.winner(@board)" do
      expect(rules).to receive(:winner)
      test_ttt.winner
    end
  end


  describe "Getting the game_board" do
    it "get_board calls @board.spaces" do
      expect(board).to receive(:spaces)
      test_ttt.get_board
    end
  end

  describe "Playing a Human move" do
    it "if move is valid @board.spaces and @player.switch_turns are called" do
      expect(board).to receive(:valid_move?).with(0).and_return(true)
      expect(board).to receive(:play_move)
      test_ttt.play_move(0)
    end

    it "if move is not valid @board.spaces and @player.switch_turns are NOT called" do
      expect(board).to receive(:valid_move?).with(0).and_return(false)
      expect(board).to receive(:spaces).exactly(0).times
      test_ttt.play_move(0)
    end
  end
end
