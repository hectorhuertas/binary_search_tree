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

  def test_it_has_an_insert_method
    binary_search_tree = BinarySearchTree.new
    assert binary_search_tree.respond_to? :insert
  end

  def test_it_has_and_includeqm_method
    binary_search_tree = BinarySearchTree.new
    assert binary_search_tree.respond_to? :include?
  end
end
