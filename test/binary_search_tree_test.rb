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

  def test_it_can_insert_left
    bst = BinarySearchTree.new

    bst.insert(50, "Hannibal Buress: Animal Furnace")
    bst.insert(40, "Another Movie")

    assert_equal 50, bst.root.rank
    assert_equal "Hannibal Buress: Animal Furnace", bst.root.title
    assert_equal 40, bst.root.left_next_node.rank
    assert_equal "Another Movie", bst.root.left_next_node.title
  end

  def test_it_can_insert_right
    bst = BinarySearchTree.new

    bst.insert(50, "Hannibal Buress: Animal Furnace")
    bst.insert(60, "Another Movie")

    assert_equal 50, bst.root.rank
    assert_equal "Hannibal Buress: Animal Furnace", bst.root.title
    assert_equal 60, bst.root.right_next_node.rank
    assert_equal "Another Movie", bst.root.right_next_node.title
  end

  def test_it_can_add_left_and_right_accurately
    bst = BinarySearchTree.new

    bst.insert(50, "Hannibal Buress: Animal Furnace")
    bst.insert(40, "Something")
    bst.insert(60, "Another Movie")
    bst.insert(45, "Middle")
    bst.insert(42, "left right left")
    bst.insert(70, "right right")
    bst.insert(65, "right right left")
    bst.insert(59, "right left")

    assert_equal 50, bst.root.rank
    assert_equal "Hannibal Buress: Animal Furnace", bst.root.title
    assert_equal 40, bst.root.left_next_node.rank
    assert_equal "Something", bst.root.left_next_node.title
    assert_equal 60, bst.root.right_next_node.rank
    assert_equal "Another Movie", bst.root.right_next_node.title
    assert_equal 45, bst.root.left_next_node.right_next_node.rank
    assert_equal "Middle", bst.root.left_next_node.right_next_node.title
    assert_equal 42, bst.root.left_next_node.right_next_node.left_next_node.rank
    assert_equal "left right left", bst.root.left_next_node.right_next_node.left_next_node.title
    assert_equal 70, bst.root.right_next_node.right_next_node.rank
    assert_equal "right right", bst.root.right_next_node.right_next_node.title
    assert_equal 65, bst.root.right_next_node.right_next_node.left_next_node.rank
    assert_equal "right right left", bst.root.right_next_node.right_next_node.left_next_node.title
    assert_equal 59, bst.root.right_next_node.left_next_node.rank
    assert_equal "right left", bst.root.right_next_node.left_next_node.title
  end

  def test_insertion_returns_depth_level
    bst = BinarySearchTree.new

    expected = bst.insert(50, "Hannibal Buress: Animal Furnace")
    expected1 = bst.insert(40, "Something")
    expected2 = bst.insert(60, "Another Movie")
    expected3 = bst.insert(45, "Middle")
    expected4 = bst.insert(42, "left right left")
    expected5 = bst.insert(70, "right right")
    expected6 = bst.insert(65, "right right left")

    assert_equal 0, expected
    assert_equal 1, expected1
    assert_equal 1, expected2
    assert_equal 2, expected3
    assert_equal 3, expected4
    assert_equal 2, expected5
    assert_equal 3, expected6
  end

  def test_it_returns_true_or_false_based_on_whether_or_not_rank_is_in_tree
    bst = BinarySearchTree.new

    assert_equal "false", bst.include?(61)

    bst.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal "true", bst.include?(61)

    assert_equal "false", bst.include?(16)

    bst.insert(16, "Johnny English")
    assert_equal "true", bst.include?(16)

    bst.insert(42, "left right left")
    bst.insert(70, "right right")

    assert_equal "true", bst.include?(42)
    assert_equal "true", bst.include?(70)
    assert_equal "false", bst.include?(35)
  end

  def test_depth_of_returns_depth_of_node
    bst = BinarySearchTree.new

    bst.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal 0, bst.depth_of(61)
    assert_nil bst.depth_of(100)

    bst.insert(16, "Johnny English")
    assert_equal 1, bst.depth_of(16)

    bst.insert(92, "Sharknado 3")
    assert_equal 1, bst.depth_of(92)
  end

  def test_max_returns_maximum_ranked_movie_as_a_hash
    bst = BinarySearchTree.new

    assert_nil bst.max

    bst.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal ({"Bill & Ted's Excellent Adventure" => 61}), bst.max

    bst.insert(16, "Johnny English")
    bst.insert(92, "Sharknado 3")
    bst.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Sharknado 3" => 92}), bst.max
  end

  def test_min_returns_minimum_ranked_movie_as_a_hash
    bst = BinarySearchTree.new

    assert_nil bst.min

    bst.insert(61, "Bill & Ted's Excellent Adventure")
    assert_equal ({"Bill & Ted's Excellent Adventure" => 61}), bst.min

    bst.insert(16, "Johnny English")
    bst.insert(92, "Sharknado 3")
    bst.insert(50, "Hannibal Buress: Animal Furnace")

    assert_equal ({"Johnny English" => 16}), bst.min
  end
end
