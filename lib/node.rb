class Node
  attr_reader   :rank,
                :title
  attr_accessor :left_next_node,
                :right_next_node

  def initialize(rank, title)
    @rank            = rank
    @title           = title
    @left_next_node  = nil
    @right_next_node = nil
  end
end
