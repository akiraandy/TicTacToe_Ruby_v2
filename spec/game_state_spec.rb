require 'game_state'
require 'game_board'

describe GameState do
  let (:test_board) { GameBoard.new(3) }

  it "Makes a deep copy of the game_board " do
      test_state = GameState.new(test_board, 'X', 'O')
      test_board.spaces[0] = 'X'
      expect(test_state.game_board.spaces[0]).to eq(' ')
  end

  it "Swaps players " do
    test_state = GameState.new(test_board, 'X', 'O')
    test_state.switch_turns
    expect(test_state.player).to eq('O')
  end


end
