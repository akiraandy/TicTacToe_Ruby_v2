require 'game_loop'


describe GameLoop do
  let(:board) { double }
  let(:game_screen) { double }
  let(:rules) { double }
  let(:players) { double }


  let(:test_loop) { GameLoop.new(board, game_screen, rules, players)}

  describe "The game_loop " do
    it "calls @screen.print_end_of_game if @rules.game_over? == true " do
      allow(rules).to receive(:game_over?) { true }
      allow(game_screen).to receive(:print_screen) 
      expect(game_screen).to receive(:print_end_of_game)
      expect(players).to receive(:play_turn)
      test_loop.game_loop
    end

    it "doesn't print end of screen if @rules.game_over? == false " do
      allow(rules).to receive(:game_over?).and_return(false, true)
      allow(game_screen).to receive(:print_screen)
      expect(players).to receive(:play_turn)
      expect(players).to receive(:play_turn)
      expect(game_screen).to receive(:print_end_of_game)
      test_loop.game_loop
    end
  end
end
