require 'player'
describe Player do
  let(:game_io) { GameIo.new}
  let(:test_player) { Player.new('X', 'Human') }
  it "mark should retrun 'X' if that was passed in for consturctor " do
    expect(test_player.mark).to eq('X')
  end
  it "type should return 'Human' for human player " do
    expect(test_player.type).to eq('Human')
  end
end
