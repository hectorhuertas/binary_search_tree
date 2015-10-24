require 'pry'
class Node
  attr_reader :value, :lesser_child, :greater_child

  def initialize(value)
    @value = value
  end

  def insert_at(location, new_value)
    if send(location).nil?
      instance_variable_set(:"@#{location}", Node.new(new_value))
    else
      send(location).insert(new_value)
    end
  end

  def insert(new_value)
    case new_value <=> value
    when 0  then p 'Data already on tree'
    when -1 then insert_at(:lesser_child, new_value)
    when 1  then insert_at(:greater_child, new_value)
    end
  end

  def leave?
    lesser_child.nil? && greater_child.nil?
  end

  def include_at?(location,sought_value)
    # if location.nil?
    #   false
    # else
      location && location.include?(sought_value)
    # end
  end

  def include?(sought_value)
    if sought_value == value
      true
    elsif leave?
      false
    else
      include_at?(lesser_child,sought_value) ||
       include_at?(greater_child,sought_value)
    end
  end

  def minimum
    min_array = [value]
    min_array << lesser_child.minimum unless lesser_child.nil?
    min_array << greater_child.minimum unless greater_child.nil?
    min_array.min

  end

  def maximum
    max_array = [value]
    max_array << lesser_child.maximum unless lesser_child.nil?
    max_array << greater_child.maximum unless greater_child.nil?
    max_array.max
  end

  def depth_of(input_value)
    if input_value == value
      1
    else
      depth = 0
      if lesser_child && lesser_child.depth_of(input_value) > 0
        depth += 1 + lesser_child.depth_of(input_value)
      end
      if greater_child && greater_child.depth_of(input_value) > 0
        depth += 1 + greater_child.depth_of(input_value)
      end
      depth
    end
  end

  def max_depth
    # binding.pry
    max_depth = [0]
    if lesser_child.nil? && greater_child.nil?
      max_depth << 1
    end
    if !lesser_child.nil?
      max_depth << 1 + lesser_child.max_depth
    end
    if !greater_child.nil?
      max_depth << 1 + greater_child.max_depth
    end
    max_depth.max
  end

  def merge_arrays(left_values,right_values)
    # binding.pry
    sorted_values = []
    while !left_values.empty? && !right_values.empty?
      if left_values[0]<right_values[0]
        sorted_values<<left_values.shift
      else
        sorted_values<<left_values.shift
      end
    end
    if left_values.empty?
      sorted_values += right_values
    else
      sorted_values += left_values
    end
    sorted_values
  end

  def my_sort
    # binding.pry
    left_values = []
    right_values = []
    if !lesser_child.nil?
      left_values=lesser_child.my_sort
    end
    if !greater_child.nil?
      right_values=greater_child.my_sort
    end
    left_values = merge_arrays(left_values,[self.value])
    sorted_values = merge_arrays(left_values,right_values)
  end

  def leaves_count

    if lesser_child.nil? && greater_child.nil?
      1
    else
      total=0
      if !lesser_child.nil?
        total+= lesser_child.leaves_count
      end
      if !greater_child.nil?
        total += greater_child.leaves_count
      end
      total
    end
  end

end

class NilClassNode
  def self.bob
    'nil'
  end
end

class NodeNode
  def self.bob
    'node'
  end
end

class Manager
  def bob
    # Object.const_get("NodeNode").bob
    NodeNode.bob

  end
end
