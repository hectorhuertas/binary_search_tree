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
    if !left.nil?
      left_values=left.my_sort
    end
    if !right.nil?
      right_values=right.my_sort
    end
    left_values = merge_arrays(left_values,[self.value])
    sorted_values = merge_arrays(left_values,right_values)
  end

  def leaves_count

    if left.nil? && right.nil?
      1
    else
      total=0
      if !left.nil?
        total+= left.leaves_count
      end
      if !right.nil?
        total += right.leaves_count
      end
      total
    end
  end

end
