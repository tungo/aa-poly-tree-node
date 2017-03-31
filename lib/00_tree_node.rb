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

  def add_child(child_node)
    if child_node.is_a?(PolyTreeNode)
      child_node.parent = self
    end
  end

  def remove_child(child_node)
    raise "Not a child" unless @children.include?(child_node)
    if child_node.is_a?(PolyTreeNode )
      child_node.parent = nil
      @children.delete(child_node)
    end
  end

end
