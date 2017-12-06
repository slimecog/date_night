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
end
