require 'minitest'
require 'node'

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
    assert_equal 4,node.lesser_child.value
  end

  def test_it_inserts_lesser_values_on_lesser_child
    node = Node.new(5)
    node.insert(4)
    assert_equal 4,node.lesser_child.value
    refute node.greater_child
  end

  def test_it_inserts_greater_values_on_greater_child
    node = Node.new(5)
    node.insert(7)
    assert_equal 7,node.greater_child.value
    refute node.lesser_child
  end

  def test_it_inserts_several_values_in_correct_positions
    node = Node.new(5)
    node.insert(7)
    node.insert(6)
    node.insert(9)
    assert_equal 7, node.greater_child.value
    assert_equal 6, node.greater_child.lesser_child.value
    assert_equal 9, node.greater_child.greater_child.value
  end

  def test_it_doesnt_allow_duplicates
    node = Node.new(5)
    assert_equal 'Data already on tree', node.insert(5)
  end

end
