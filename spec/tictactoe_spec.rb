require 'tictactoe'

describe TicTacToe do

  describe "Players " do

    describe "switch_turns " do
      it "switch_turns swaps the current_player and non_current_player " do
        p1 = subject.current_player
        p2 = subject.non_current_player
        subject.switch_turns
        test1 = (p1 == subject.non_current_player)
        test2 = (p2 == subject.current_player)
        expect(test1 && test2).to eq(true)
      end

      it "After play move the current player has changed " do
        subject.switch_turns
        next_player = subject.non_current_player
        subject.play_turn
        expect(next_player == subject.current_player).to eq(true)
      end

      it "After play move available_moves.size is 1 less " do
        before_size = subject.myBoard.available_moves.size
        subject.switch_turns
        subject.play_turn
        after_size = subject.myBoard.available_moves.size
        expect((before_size - 1) == (after_size)).to eq(true)
      end

    end
  end

end
