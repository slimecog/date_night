class BinarySearchTree
  attr_reader :root

  def initialize
    @root = root
  end

  def insert(rank, title)
    if @root.nil?
      @root = Node.new(rank, title)
      # return @root.depth
    elsif @root.insert(rank, title)
    end
  end
end
