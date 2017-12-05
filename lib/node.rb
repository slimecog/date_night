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
      # return depth += 1
    else @left_next_node.insert(rank, title)
    end
  end

  def right_insert(rank, title)
    if @right_next_node.nil?
      @right_next_node = Node.new(rank, title)
      # return depth += 1
    else @right_next_node.insert(rank, title)
    end
  end
end
