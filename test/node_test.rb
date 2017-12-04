require_relative "test_helper"
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new(90, "title")

    assert_instance_of Node, node
  end

  def test_is_holds_rank
    node = Node.new(90, "title")

    assert_equal 90, node.rank
    assert_equal "title", node.title
  end

  def test_it_can_hold_different_rank
    node1 = Node.new(90, "title")
    node2 = Node.new(61, "Bill & Ted's Excellent Adventure")

    assert_equal 90, node1.rank
    assert_equal "title", node1.title
    assert_equal 61, node2.rank
    assert_equal "Bill & Ted's Excellent Adventure", node2.title
  end

  def test_it_can_hold_more_different_rank
    node1 = Node.new(61, "Bill & Ted's Excellent Adventure")
    node2 = Node.new(16, "Johnny English")
    node3 = Node.new(92, "Sharknado 3")
    node4 = Node.new(50, "Hannibal Buress: Animal Furnace")
    node5 = Node.new(22, "Experimenter")

    assert_equal 61, node1.rank
    assert_equal "Bill & Ted's Excellent Adventure", node1.title
    assert_equal 16, node2.rank
    assert_equal "Johnny English", node2.title
    assert_equal 92, node3.rank
    assert_equal "Sharknado 3", node3.title
    assert_equal 50, node4.rank
    assert_equal "Hannibal Buress: Animal Furnace", node4.title
    assert_equal 22, node5.rank
    assert_equal "Experimenter", node5.title
  end

  def test_it_is_created_with_nil_next_node_links
    node1 = Node.new(22, "Experimenter")
    node2 = Node.new(50, "Hannibal Buress: Animal Furnace")

    assert_equal 22, node1.rank
    assert_equal "Experimenter", node1.title
    assert_nil node1.left_next_node
    assert_nil node1.right_next_node
    assert_equal 50, node2.rank
    assert_equal "Hannibal Buress: Animal Furnace", node2.title
    assert_nil node2.left_next_node
    assert_nil node2.right_next_node
  end
end
