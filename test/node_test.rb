require_relative "test_helper"
require_relative "../lib/node"

class NodeTest < Minitest::Test

  def test_it_exists
    node = Node.new("data")

    assert_instance_of Node, node
  end

  def test_is_holds_data
    node = Node.new("data")

    assert_equal "data", node.data
  end

  def test_it_can_hold_different_data
    node1 = Node.new("data")
    node2 = Node.new("something else")

    assert_equal "data", node1.data
    assert_equal "something else", node2.data
  end

  def test_it_can_hold_more_different_data
    node1 = Node.new("data")
    node2 = Node.new("something else")
    node3 = Node.new("cookies")
    node4 = Node.new("muffins")
    node5 = Node.new("hella")

    assert_equal "data", node1.data
    assert_equal "something else", node2.data
    assert_equal "cookies", node3.data
    assert_equal "muffins", node4.data
    assert_equal "hella", node5.data
  end

  def test_it_is_created_with_nil_next_node_links
    node1 = Node.new("data")
    node2 = Node.new("other data")

    assert_equal "data", node1.data
    assert_nil node1.left_next_node
    assert_nil node1.right_next_node
    assert_equal "other data", node2.data
    assert_nil node2.left_next_node
    assert_nil node2.right_next_node
  end

end
