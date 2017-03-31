class KnightPathFinder
  DELTA = [
    [-1, -2],
    [-1, 2],
    [-2, -1],
    [-2, 1],
    [1, -2],
    [1, 2],
    [2, -1],
    [2, 1]
  ]

  def initialize(pos)
    @visited_positions = [pos]
  end

  def find_path()

  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    valid_moves = valid_moves.reject do |move|
      @visited_positions.include?(pos)
    end
    @visited_positions.concat(valid_moves)
  end

  def self.valid_moves(pos)
    result = []
    DELTA.each do |move|
      result << [pos[0] + move[0], pos[1] + move[1]]
    end
    result.select do |move|
      row, col = move
      row.between?(0, 8) && col.between?(0, 8)
    end
  end


end
