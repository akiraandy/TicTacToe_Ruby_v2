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

  describe "making a new game" do
    it "@board is empty after call to new_game" do
      empty_board = []
      (9).times do
        empty_board.push(' ')
      end
      subject.play_human_move(0)
      subject.new_game
      expect(subject.get_board).to eq(empty_board)
    end
  end

  describe "boolean methods : game_over? tied? valid_move?" do
    it "returns false when game is not over" do
      subject.instance_variable_set("@rules", rules)
      expect(rules).to receive(:game_over?)
      subject.game_over?
    end

    it "tied? calls rules.tied?" do
      subject.instance_variable_set("@rules", rules)
      expect(rules).to receive(:tied?)
      subject.tied_game?
    end

    it "valid_move? calls board.valid_move?" do
      subject.instance_variable_set("@board", board)
      expect(board).to receive(:valid_move?).with(0)
      subject.valid_move?(0)
    end
  end

  describe "Getting the winner" do
    it "winner calls rules.winner(@board)" do
      subject.instance_variable_set("@rules", rules)
      expect(rules).to receive(:winner)
      subject.winner
    end
  end


  describe "Getting the game_board" do
    it "get_board calls @board.spaces" do
      subject.instance_variable_set("@board", board)
      expect(board).to receive(:spaces)
      subject.get_board
    end
  end

  describe "Playing a Human move" do
    it "if move is valid @board.spaces and @player.switch_turns are called" do
      subject.instance_variable_set("@players", players)
      subject.instance_variable_set("@board", board)
      expect(board).to receive(:valid_move?).with(0).and_return(true)
      expect(board).to receive(:spaces)
      allow(players).to receive(:current_player).and_return(test_player)
      expect(players).to receive(:switch_turns)
      subject.play_human_move(0)
    end

    it "if move is not valid @board.spaces and @player.switch_turns are NOT called" do
      subject.instance_variable_set("@board", board)
      subject.instance_variable_set("@players", players)
      expect(board).to receive(:valid_move?).with(0).and_return(false)
      expect(board).to receive(:spaces).exactly(0).times
      expect(players).to receive(:switch_turns).exactly(0).times
      subject.play_human_move(0)
    end
  end

  describe "Getting an Ai move" do
    it "current_player is an Ai it calls get_move" do
      subject.instance_variable_set("@players", players)
      expect(subject).to receive(:get_game_state)
      expect(subject).to receive(:is_current_player_ai?).and_return(true)
      expect(players).to receive(:current_player).and_return(test_player)
      expect(test_player).to receive(:type).and_return(ai_basic)
      expect(ai_basic).to receive(:get_move)
      subject.get_ai_player_move
    end

    it "current_player is NOT Ai it doesn't call get_move" do
      subject.instance_variable_set("@players", players)
      expect(subject).to receive(:is_current_player_ai?).and_return(false)
      expect(subject).to receive(:get_game_state).exactly(0).times
      expect(players).to receive(:current_player).and_return(test_player).exactly(0).times
      expect(test_player).to receive(:type).and_return(ai_basic).exactly(0).times
      expect(ai_basic).to receive(:get_move).exactly(0).times
      subject.get_ai_player_move
    end
  end

  describe "Setting player's type" do
    it "set_player1_ai_easy calls @players.set_player1_type" do
      subject.instance_variable_set("@players", players)
      expect(players).to receive(:set_player1_type)
      subject.set_player1_ai_easy
    end

    it "set_player1_ai_hard calls @players.set_player1_type" do
      subject.instance_variable_set("@players", players)
      expect(players).to receive(:set_player1_type)
      subject.set_player1_ai_hard
    end

    it "set_player2_ai_easy calls @players.set_player2_type" do
      subject.instance_variable_set("@players", players)
      expect(players).to receive(:set_player2_type)
      subject.set_player2_ai_easy
    end

    it "set_player2_ai_hard calls @players.set_player2_type" do
      subject.instance_variable_set("@players", players)
      expect(players).to receive(:set_player2_type)
      subject.set_player2_ai_hard
    end
  end
end
