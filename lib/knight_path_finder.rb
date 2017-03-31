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

  end

  def find_path()

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
