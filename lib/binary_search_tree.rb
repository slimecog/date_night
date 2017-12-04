class BinarySearchTree
  attr_reader :root

  def initialize
    @root = root
  end

  def insert(rank, title)
    current = @root
    if @root.nil?
      @root = Node.new(rank, title)
    elsif current.rank > rank
      left_insert(rank, title)
    elsif current.rank < rank
      right_insert
    end
  end

  def left_insert(rank, title)#, current = @root)
    counter = 0
    if current.left_next_node.nil?
      current = Node.new(rank, title)
      counter += 1
    else
      insert(rank, title)
    end
  end
  counter
end
