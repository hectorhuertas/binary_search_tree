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
end
