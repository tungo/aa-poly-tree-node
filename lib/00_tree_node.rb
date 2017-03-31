class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def children
    @children
  end

  def value
    @value
  end

  def parent=(node)
    @parent.children.delete(self) unless @parent.nil?

    if node.is_a?(PolyTreeNode)
      @parent = node
      node.children << self
    elsif node.nil?
      @parent = node
    end
  end


end
