require 'pry'
class Node
  attr_reader :value, :left, :right

  def initialize(value)
    @value = value
  end

  def set_value(side, node, inserting_value)
    if node.nil?
      instance_variable_set(side, Node.new(inserting_value))
    else
      node.insert(inserting_value)
    end
  end

  def insert(data)
    case data <=> value
      when 0  then p 'Data already on tree'
      when -1 then set_value(:@left, left, data)
      when 1  then set_value(:@right, right, data)
    end
  end
end
