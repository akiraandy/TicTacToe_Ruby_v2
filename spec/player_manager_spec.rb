require 'player_manager'


describe PlayerManager do

  let (:test_manager) { PlayerManager.new(:HUMAN, :EASY) }
  let (:test_manager2) { PlayerManager.new(:HARD, :EASY) }
  
  describe "Constructor" do
    it "creates a player 1 with a mark of :X" do 
      expect(test_manager.current_player.mark).to eq(:X)
    end

    it "creates a player 2 with a mark of :O" do
      test_manager.switch_turns
      expect(test_manager.current_player.mark).to eq(:O)
    end
    
    it "sets player 1 to Human when 'HUMAN' is argument 1 of constructor" do
      expect(test_manager.current_player.type).to eq(:HUMAN)
    end

    it "sets player 2 to AiBasic class when 'EASY' is argument 2 of constructor" do
      test_manager.switch_turns
      expect(test_manager.current_player.type.class).to eq(AiBasic)
    end

    it "set player 1 to AiMinimax class when 'HARD' is argument 1 of constructor" do
       expect(test_manager2.current_player.type.class).to eq(AiMinimax)
    end
  end

  describe "switching turns" do
    it "current_player = player2 after switch_turns is called" do
      player2 = test_manager.non_current_player
      test_manager.switch_turns
      expect(test_manager.current_player).to eq(player2)
    end
  end
end
