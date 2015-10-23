require_relative 'node'
class BinarySearchTree
  attr_reader :head

  def insert(value)
    if head.nil?
      @head = Node.new(value)
    else
      #check uniqueness
      head.insert(value)
    end
  end

  def include?(value)
    return false if head.nil?
    head.include?(value)
  end

  def maximum
    return false if head.nil?
    head.maximum
  end

  def minimum
    return false if head.nil?
    head.minimum
  end

  def depth_of(value)
    return false if head.nil?
    head.depth_of(value)
  end

end
