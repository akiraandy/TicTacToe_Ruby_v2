class Game_Board

  attr_accessor :spaces
  attr_accessor :grid_size

  def initialize(grid_size)
    @grid_size = 3
    clear
  end

  def clear(char = ' ')
    @spaces = Array.new(@grid_size * @grid_size, char)
  end

  def valid_move?(space)
    @spaces[space] == ' '
  end

  def available_moves
    rtn_moves = []
    @spaces.each.with_index do | val, i |
      rtn_moves << i if valid_move?(i)
    end
    rtn_moves
  end

  def full?
    available_moves.size == 0
  end

  def empty?
    available_moves.size == @spaces.size
  end

  def size
    @spaces.size
  end
end
