class BinarySearchTree
  attr_reader :root

  def initialize
    @root = root
  end

  def insert(rank, title)
    if @root.nil?
      @root = Node.new(rank, title)
      # return @root.depth
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
end
