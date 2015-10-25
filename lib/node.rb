require 'pry'
class Node
  attr_reader :value, :lesser_child, :greater_child

  def initialize(value)
    @value = value
  end

  def childs
    [lesser_child,greater_child].select { |child| child}
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

  def leaf?
    childs.empty?
  end

  # def include_at?(location,sought_value)
  #   location.include?(sought_value) if location
  # end

  def include?(sought_value)
    if sought_value == value
      true
    elsif leaf?
      false
    else
      childs.any? {|child| child.include?(sought_value)}
      # childs.any? {|child| include_at?(child,sought_value)}
      # include_at?(lesser_child,sought_value) ||
      #  include_at?(greater_child,sought_value)
    end
  end

  def minimum
    ([value] + childs.map{|child| child.minimum}).min
    # min_array = [value]
    # min_array << lesser_child.minimum unless lesser_child.nil?
    # min_array << greater_child.minimum unless greater_child.nil?
    # min_array.min

  end

  def maximum
    ([value] + childs.map{|child| child.maximum}).max

    # max_array = [value]
    # max_array << lesser_child.maximum unless lesser_child.nil?
    # max_array << greater_child.maximum unless greater_child.nil?
    # max_array.max
  end

  # def depth_of(input_value)
  #   if input_value == value
  #     1
  #   else
  #     depth = 0
  #     if lesser_child && lesser_child.depth_of(input_value) > 0
  #       depth += 1 + lesser_child.depth_of(input_value)
  #     end
  #     if greater_child && greater_child.depth_of(input_value) > 0
  #       depth += 1 + greater_child.depth_of(input_value)
  #     end
  #     depth
  #   end
  # end

  def depth_of(input_value)
    if input_value == value
      1
    elsif leaf?
      0
    else
      # childs.reduce(0){|sum,child|sum + child.depth_of(input_value) + 1}
      childs.select{|child|child.include?(input_value)}.first.depth_of(input_value) + 1
      # depth = 0
      # if lesser_child && lesser_child.depth_of(input_value) > 0
      #   depth += 1 + lesser_child.depth_of(input_value)
      # end
      # if greater_child && greater_child.depth_of(input_value) > 0
      #   depth += 1 + greater_child.depth_of(input_value)
      # end
      # depth
    end
  end

  # def max_depth
  #   # binding.pry
  #   max_depth = [0]
  #   if lesser_child.nil? && greater_child.nil?
  #     max_depth << 1
  #   end
  #   if !lesser_child.nil?
  #     max_depth << 1 + lesser_child.max_depth
  #   end
  #   if !greater_child.nil?
  #     max_depth << 1 + greater_child.max_depth
  #   end
  #   max_depth.max
  # end

  def max_depth
    ([1] + childs.map{|child|child.max_depth + 1}).max
    # max_depth = [0]
    # if lesser_child.nil? && greater_child.nil?
    #   max_depth << 1
    # end
    # if !lesser_child.nil?
    #   max_depth << 1 + lesser_child.max_depth
    # end
    # if !greater_child.nil?
    #   max_depth << 1 + greater_child.max_depth
    # end
    # max_depth.max
  end

  # def merge_arrays(left_values,right_values)
  #   # binding.pry
  #   sorted_values = []
  #   while !left_values.empty? && !right_values.empty?
  #     if left_values[0]<right_values[0]
  #       sorted_values<<left_values.shift
  #     else
  #       sorted_values<<left_values.shift
  #     end
  #   end
  #   if left_values.empty?
  #     sorted_values += right_values
  #   else
  #     sorted_values += left_values
  #   end
  #   sorted_values
  # end

  def my_sort
    # binding.pry
    # left_values = []
    # right_values = []
    # if !lesser_child.nil?
    #   left_values=lesser_child.my_sort
    # end
    # if !greater_child.nil?
    #   right_values=greater_child.my_sort
    # end
    # total = [value] + left_values + right_values
    total = childs.reduce([value]){|sum,child| sum + child.my_sort}
    Sorter.new.sort(total)
    # left_values = merge_arrays(left_values,[self.value])
    # sorted_values = merge_arrays(left_values,right_values)
  end

  class Sorter
    def sort(array)
      1.upto(array.size - 1) do |count|
        count.times do |pos|
          if array[count] < array[pos]
            array.insert(pos, array.delete_at(count))
          end
        end
      end

      array

    end
  end

  # def sort
  #   sorted_values = []
  #   sorted_values = Sorter.sort(value,left_values)
  #   sorted_values = Sorter.sort (sorted_values,right_values)
  #
  #   all values = value + child.values
  #
  #   sorted_values =Sorter.new.sort(all_values)
  #
  # end

  # def leaves_count
  #
  #   if leaf?
  #     1
  #   else
  #     total=0
  #     if !lesser_child.nil?
  #       total+= lesser_child.leaves_count
  #     end
  #     if !greater_child.nil?
  #       total += greater_child.leaves_count
  #     end
  #     total
  #   end
  # end

  def leaves_count

    if leaf?
      1
    else
      childs.reduce(0){|sum,child|sum + child.leaves_count}
      # total=0
      # if !lesser_child.nil?
      #   total+= lesser_child.leaves_count
      # end
      # if !greater_child.nil?
      #   total += greater_child.leaves_count
      # end
      # total
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
