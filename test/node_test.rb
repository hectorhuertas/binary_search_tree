require 'minitest'
require 'node'
require 'sorter'

class NodeTest < Minitest::Test
  def test_it_exists
    assert Node
  end

  def test_it_takes_a_value
    assert Node.new(0)
  end

  def test_it_has_a_value_attribute
    node = Node.new(0)
    assert node.respond_to? :value
  end

  def test_it_sets_its_own_value
    node = Node.new(5)
    assert_equal 5, node.value
  end

  def test_it_inserts_one_value
    node = Node.new(5)
    node.insert(4)
    assert_equal 4, node.lesser_child.value
  end

  def test_it_inserts_lesser_values_on_lesser_child
    node = Node.new(5)
    node.insert(4)
    assert_equal 4, node.lesser_child.value
    refute node.greater_child
  end

  def test_it_inserts_greater_values_on_greater_child
    node = Node.new(5)
    node.insert(7)
    assert_equal 7, node.greater_child.value
    refute node.lesser_child
  end

  def test_it_inserts_several_values_in_correct_positions
    node = Node.new(5)
    [7, 6, 9].each { |element| node.insert(element) }
    assert_equal 7, node.greater_child.value
    assert_equal 6, node.greater_child.lesser_child.value
    assert_equal 9, node.greater_child.greater_child.value
  end

  def test_it_doesnt_allow_duplicates
    node = Node.new(5)
    assert_equal 'Data already on tree', node.insert(5)
  end

  def test_include_finds_existing_values
    node = Node.new(15)
    set = [3, 5, 7, 11, 13, 15, 17]
    set.shuffle.each { |element| node.insert(element) }
    set.shuffle.each { |element| assert node.include?(element) }
  end

  def test_include_does_not_find_unexisting_values
    node = Node.new(15)
    existing = [3, 5, 7, 11, 13, 15, 17]
    unexisting = [1, 4, 6, 12, 99, 'z', Node.new(7)]
    existing.shuffle.each { |element| node.insert(element) }
    unexisting.shuffle.each { |element| refute node.include?(element) }
  end

  def test_depth_of_returns_correct_value
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    set = [5, 1, 9, 7, 10, 6]
    depths = [1, 2, 2, 3, 3, 4]
    input.each { |element| node.insert(element) }
    assert_equal depths, set.map { |element| node.depth_of(element) }
  end

  def test_maximum_returns_greater_value
    node = Node.new(5)
    input = (1..200).to_a.sample(50) + [999]
    input.shuffle.each { |element| node.insert(element) }
    assert_equal 999, node.maximum
  end

  def test_minimum_returns_lesser_value
    node = Node.new(300)
    input = (100..300).to_a.sample(50) + [99]
    input.shuffle.each { |element| node.insert(element) }
    assert_equal 99, node.minimum
  end

  def test_height_returns_heigth_of_tree
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    input.each { |element| node.insert(element) }
    assert_equal 4, node.height
  end

  def test_sort_returns_sorted_array_of_values
    node = Node.new(15)
    input = [3, 5, 7, 11, 13, 15, 17]
    input.shuffle.each { |element| node.insert(element) }
    assert_equal input, node.sort
  end

  def test_leaves_count_returns_number_of_leaves
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    input.each { |element| node.insert(element) }
    assert_equal 3, node.leaves_count
  end

  def test_childs_return_empty_array_for_leaves
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    input.each { |element| node.insert(element) }
    assert_equal [], node.lesser_child.childs
    assert_equal [], node.greater_child.greater_child.childs
    assert_equal [], node.greater_child.lesser_child.lesser_child.childs
  end

  def test_childs_return_only_one_child
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    input.each { |element| node.insert(element) }
    assert_equal 1, node.greater_child.lesser_child.childs.length
  end

  def test_childs_return_both_childs
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    input.each { |element| node.insert(element) }
    assert_equal 2, node.childs.length
    assert_equal 2, node.greater_child.childs.length
  end

  def test_leaf_returns_true_for_leaves
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    input.each { |element| node.insert(element) }
    assert node.lesser_child.leaf?
    assert node.greater_child.greater_child.leaf?
    assert node.greater_child.lesser_child.lesser_child.leaf?
  end

  def test_leaf_returns_false_for_leaves
    node = Node.new(5)
    input = [1, 9, 7, 10, 6]
    input.each { |element| node.insert(element) }
    refute node.leaf?
    refute node.greater_child.leaf?
    refute node.greater_child.lesser_child.leaf?
  end
end
