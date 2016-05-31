require 'tictactoe'
require 'ai_basic'
require 'game_rules'

describe TicTacToe do
  let(:rules) { double }
  let(:board) { double }
  let(:players) { double }
  let(:state) { double }
  let(:ai_basic) { AiBasic.new(GameRules.new) }
  Player = Struct.new(:mark, :type)
  let(:test_player) { Player.new(:X, ai_basic) }

  let(:test_ttt) { TicTacToe.new('HUMAN', 'HUMAN') }

  describe "boolean methods : game_over? tied? valid_move?" do
    it "returns false when game is not over" do
      test_ttt.instance_variable_set("@rules", rules)
      expect(rules).to receive(:game_over?)
      test_ttt.game_over?
    end

    it "tied? calls rules.tied?" do
      test_ttt.instance_variable_set("@rules", rules)
      expect(rules).to receive(:tied?)
      test_ttt.tied_game?
    end

    it "valid_move? calls board.valid_move?" do
      test_ttt.instance_variable_set("@board", board)
      expect(board).to receive(:valid_move?).with(0)
      test_ttt.valid_move?(0)
    end
  end

  describe "Getting the winner" do
    it "winner calls rules.winner(@board)" do
      test_ttt.instance_variable_set("@rules", rules)
      expect(rules).to receive(:winner)
      test_ttt.winner
    end
  end


  describe "Getting the game_board" do
    it "get_board calls @board.spaces" do
      test_ttt.instance_variable_set("@board", board)
      expect(board).to receive(:spaces)
      test_ttt.get_board
    end
  end

  describe "Playing a Human move" do
    it "if move is valid @board.spaces and @player.switch_turns are called" do
      test_ttt.instance_variable_set("@players", players)
      test_ttt.instance_variable_set("@board", board)
      expect(board).to receive(:valid_move?).with(0).and_return(true)
      expect(board).to receive(:play_move)
      allow(players).to receive(:current_player).and_return(test_player)
      test_ttt.play_move(0)
    end

    it "if move is not valid @board.spaces and @player.switch_turns are NOT called" do
      test_ttt.instance_variable_set("@board", board)
      test_ttt.instance_variable_set("@players", players)
      expect(board).to receive(:valid_move?).with(0).and_return(false)
      expect(board).to receive(:spaces).exactly(0).times
      expect(players).to receive(:switch_turns).exactly(0).times
      test_ttt.play_move(0)
    end
  end
end
