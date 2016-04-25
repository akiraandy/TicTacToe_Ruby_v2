class GameLoop

  def initialize(board, game_screen, rules, players)
    @board = board
    @players = players
    @rules = rules
    @screen = game_screen
  end

  def game_loop
    begin
      @screen.print_screen
      @players.play_turn(@board)
    end until @rules.game_over?
      @screen.print_screen
      @screen.print_end_of_game
  end
end
