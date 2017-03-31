require_relative '00_tree_node'
require "byebug"

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
    @pos = pos
    @visited_positions = [pos]
    @tree = build_move_tree
  end

  def find_path(end_pos)
    end_node = @tree.dfs(end_pos)
    return nil if end_node.nil?

    trace_path_back(end_node)
  end

  def trace_path_back(node)
    path = []

    until node.parent.nil?
      path << node.value
      node = node.parent
    end

    path << @pos
    path.reverse
  end

  def new_move_positions(pos)
    valid_moves = KnightPathFinder.valid_moves(pos)
    valid_moves = valid_moves.reject do |move|
      @visited_positions.include?(move)
    end
    @visited_positions.concat(valid_moves)
    valid_moves
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

  def build_move_tree
    root = PolyTreeNode.new(@pos)
    queue = [root]

    until queue.empty?
      node = queue.shift
      new_moves = new_move_positions(node.value)
      new_moves.each do |move|
        new_node = PolyTreeNode.new(move)
        new_node.parent = node

        queue << new_node
      end
    end

    root
  end

end

if __FILE__ == $PROGRAM_NAME
  kpf = KnightPathFinder.new([5,5])
  p kpf.find_path([3, 5])
  p kpf.find_path([1, 8])
  p kpf.find_path([5, 6])
end
