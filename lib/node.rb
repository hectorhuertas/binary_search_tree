class Node
  attr_reader :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(inserting_value)
    if inserting_value < value
      if left.nil?
        @left=Node.new(inserting_value)
      else
        left.insert(inserting_value)
      end
    else
      if right.nil?
        @right = Node.new(inserting_value)
      else
        right.insert(inserting_value)
      end
    end
  end

  def include_on_side?(side,input_value)
    if side.nil?
      false
    else
      side.include?(input_value)
    end
  end

  def include?(input_value)
    if input_value == value
      true
    elsif left.nil? && right.nil?
      false
    else
      include_on_side?(left,input_value) || include_on_side?(right,input_value)
    end
  end

  def minimum
    min_array = [value]
    min_array << left.minimum unless left.nil?
    min_array << right.minimum unless right.nil?
    min_array.min

  end

  def maximum
    max_array = [value]
    max_array << left.maximum unless left.nil?
    max_array << right.maximum unless right.nil?
    max_array.max
  end

  def depth_of(input_value)
    if input_value == value
      1
    else
      depth = 0
      if !left.nil? && left.depth_of(input_value) > 0
        depth += 1 + left.depth_of(input_value)
      end
      if !right.nil? && right.depth_of(input_value) > 0
        depth += 1 + right.depth_of(input_value)
      end
      depth
    end
  end

  def max_depth
    # binding.pry
    max_depth = [0]
    if left.nil? && right.nil?
      max_depth << 1
    end
    if !left.nil?
      max_depth << 1 + left.max_depth
    end
    if !right.nil?
      max_depth << 1 + right.max_depth
    end
    max_depth.max
    # else
    #   depth
    #   depth += left.max_depth unless left.nil?
    #   depth += right.max.depth unless right.nil?
    #   depth
    #   end
  end

end
