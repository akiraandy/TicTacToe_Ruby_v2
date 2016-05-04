require 'player_manager'



describe PlayerManager do

  describe "Setting Player's mark and type" do
    it "Default mark for player1 is :X" do
      expect(subject.current_player.mark).to eq(:X)
    end

    it "Default mark for player2 is :O" do
      expect(subject.non_current_player.mark).to eq(:O)
    end

    it "Default type for player1 is :Human" do
     expect(subject.current_player.type).to eq(:Human)
    end

    it "Default type for player2 is :Human" do
     expect(subject.non_current_player.type).to eq(:Human)
    end

    it "player1.type = :ai after set_player1_type is called" do
      subject.set_player1_type(:ai)
      expect(subject.current_player.type).to eq(:ai)
    end

    it "player2.type = :ai after set_player2_type is called" do
      subject.set_player2_type(:ai)
      expect(subject.non_current_player.type).to eq(:ai)
    end
  end

  describe "switching turns" do
    it "current_player = player2 after switch_turns is called" do
      player2 = subject.non_current_player
      subject.switch_turns
      expect(subject.current_player).to eq(player2)
    end
  end
end
