require 'minitest'
require 'binary_search_tree'

class BinarySearchTreeTest < Minitest::Test
  def test_it_exists
    assert BinarySearchTree
  end

  def test_it_takes_no_arguments
    assert BinarySearchTree.new
  end

  def test_it_has_a_head_attribute
    binary_search_tree = BinarySearchTree.new
    assert binary_search_tree.respond_to? :head
  end

  def test_it_creates_head_at_first_insertion
    binary_search_tree = BinarySearchTree.new
    binary_search_tree.insert(5)
    assert 5, binary_search_tree.head.value
  end

  def test_it_handles_include_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.include?(5)
  end

  def test_it_handles_maximum_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.maximum
  end

  def test_it_handles_minimum_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.minimum
  end

  def test_it_handles_depth_of_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.depth_of(7)
  end

  def test_it_handles_height_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.height
  end

  def test_it_handles_sort_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.sort
  end

  def test_it_handles_leaves_count_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.leaves_count
  end

  def test_it_sends_node_methods_to_head
    skip
  end

  def test_it_sorts_data_from_a_to_file
    skip
  end

end
