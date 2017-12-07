class Node
  attr_reader   :rank,
                :title
  attr_accessor :depth,
                :left_next_node,
                :right_next_node

  def initialize(rank, title)
    @rank            = rank
    @title           = title
    @depth           = 0
    @left_next_node  = nil
    @right_next_node = nil
  end

  def insert(rank, title)
    if @rank > rank
      left_insert(rank, title)
    elsif @rank < rank
      right_insert(rank, title)
    end
  end

  def left_insert(rank, title)
    if @left_next_node.nil?
      @left_next_node = Node.new(rank, title)
      @left_next_node.depth += 1
    else @left_next_node.insert(rank, title)
        @left_next_node.depth += 1
    end
  end

  def right_insert(rank, title)
    if @right_next_node.nil?
      @right_next_node = Node.new(rank, title)
      @right_next_node.depth += 1
    else @right_next_node.insert(rank, title)
        @right_next_node.depth += 1
    end
  end

  def include?(rank)
    if @rank == rank
      "true"
    elsif @left_next_node.nil? && @right_next_node.nil?
      "false"
    elsif @left_next_node.nil? || @rank < rank
      @right_next_node.include?(rank)
    elsif @right_next_node.nil? || @rank > rank
      @left_next_node.include?(rank)
    end
  end

  def depth_of(rank)
    if @rank == rank
      @depth
    elsif @left_next_node.nil? && @right_next_node.nil?
      nil
    elsif @left_next_node.nil? || @rank < rank
      @right_next_node.depth_of(rank)
    elsif @right_next_node.nil? || @rank > rank
      @left_next_node.depth_of(rank)
    end
  end

  def create_hash
    {@title => @rank}
  end

  def max
    if @right_next_node.nil?
      create_hash
    else @right_next_node.max
    end
  end

  def min
    if @left_next_node.nil?
      create_hash
    else @left_next_node.min
    end
  end

  def min_sort
    sorted_array = []
    current = @left_next_node
    until current.left_next_node.nil?
      sorted_array << create_hash
      current = @left_next_node
    end
  end

  def sort
    sorted_array = []
    until self.min.nil?
      sorted_array << self.min
    end
    sorted_array
  end
end
