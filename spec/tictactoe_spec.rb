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
  let(:test_ttt) { TicTacToe.new(players, board, rules) }

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
      allow(players).to receive(:current_player).and_return(test_player)
      expect(players).to receive(:switch_turns)
      test_ttt.play_move(0)
    end

    it "if move is not valid @board.spaces and @player.switch_turns are NOT called" do
      expect(board).to receive(:valid_move?).with(0).and_return(false)
      expect(board).to receive(:spaces).exactly(0).times
      expect(players).to receive(:switch_turns).exactly(0).times
      test_ttt.play_move(0)
    end
  end

  describe "Getting an Ai move" do
    it "current_player is an Ai it calls get_move" do
      expect(test_ttt).to receive(:get_game_state)
      expect(test_ttt).to receive(:is_current_player_ai?).and_return(true)
      expect(players).to receive(:current_player).and_return(test_player)
      expect(test_player).to receive(:type).and_return(ai_basic)
      expect(ai_basic).to receive(:get_move)
      test_ttt.get_ai_player_move
    end

    it "current_player is NOT Ai it doesn't call get_move" do
      expect(test_ttt).to receive(:is_current_player_ai?).and_return(false)
      expect(test_ttt).to receive(:get_game_state).exactly(0).times
      expect(players).to receive(:current_player).and_return(test_player).exactly(0).times
      expect(test_player).to receive(:type).and_return(ai_basic).exactly(0).times
      expect(ai_basic).to receive(:get_move).exactly(0).times
      test_ttt.get_ai_player_move
    end
  end
end
