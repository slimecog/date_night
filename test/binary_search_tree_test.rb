require_relative "test_helper"
require_relative "../lib/binary_search_tree"

class BinarySearchTreeTest < Minitest::Test

  def test_it_exists
    bst = BinarySearchTree.new

    assert_instance_of BinarySearchTree, bst
  end


end
