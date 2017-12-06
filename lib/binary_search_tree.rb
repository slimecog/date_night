class BinarySearchTree
  attr_reader :root

  def initialize
    @root = root
  end

  def insert(rank, title)
    if @root.nil?
      @root = Node.new(rank, title)
      return 0
    else @root.insert(rank, title)
    end
  end

  def include?(rank)
    if @root.nil?
      "false"
    elsif @root.rank == rank
      "true"
    elsif @root.left_next_node.nil? && @root.right_next_node.nil?
      "false"
    else @root.include?(rank)
    end
  end

  def depth_of(rank)
    if @root.nil?
      nil
    elsif @root.rank == rank
      0
    elsif @root.left_next_node.nil? && @root.right_next_node.nil?
      nil
    else @root.depth_of(rank)
    end
  end

  def max
    if @root.nil?
      nil
    else @root.max
    end
  end

  def min
    if @root.nil?
      nil
    else @root.min
    end
  end
end
