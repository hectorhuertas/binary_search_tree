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

  def test_it_handles_delete_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    refute binary_search_tree.delete(6)
  end

  def test_it_handles_count_when_empty_tree
    binary_search_tree = BinarySearchTree.new
    assert_equal 0, binary_search_tree.count
  end

  def test_it_sorts_data_from_a_to_file
    binary_search_tree = BinarySearchTree.new
    input = "5\n1\n8\n4\n9\n"
    expected = "1\n4\n5\n8\n9"
    assert_equal expected, binary_search_tree.sort_file_data(input)
  end

  def test_it_deletes_head
    binary_search_tree = BinarySearchTree.new
    binary_search_tree.insert(50)
    input = (0..100).to_a
    input.shuffle.each { |element| binary_search_tree.insert(element) }
    binary_search_tree.delete(50)
    refute binary_search_tree.include?(50)
  end

  def test_delete_keeps_every_other_element
    binary_search_tree = BinarySearchTree.new
    binary_search_tree.insert(50)
    input = (0..100).to_a
    input.shuffle.each { |element| binary_search_tree.insert(element) }
    binary_search_tree.delete(50)
    assert_equal 100, binary_search_tree.count
  end
end
