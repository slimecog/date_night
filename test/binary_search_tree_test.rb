require_relative "test_helper"
require_relative "../lib/binary_search_tree"
require_relative "../lib/node"

class BinarySearchTreeTest < Minitest::Test

  def test_it_exists
    bst = BinarySearchTree.new

    assert_instance_of BinarySearchTree, bst
  end

  def test_insert_can_add_to_a_nil_root
    bst = BinarySearchTree.new

    bst.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal 50, bst.root.rank
    assert_equal "Hannibal Buress: Animal Furnace", bst.root.title
  end

end
