require_relative 'sorter'

class Node
  attr_reader :value, :lesser_child, :greater_child

  def initialize(value)
    @value = value
  end

  def childs
    [lesser_child, greater_child].select { |child| child }
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

  def include?(sought_value)
    if sought_value == value
      true
    elsif leaf?
      false
    else
      childs.any? { |child| child.include?(sought_value) }
    end
  end

  def minimum
    ([value] + childs.map(&:minimum)).min
  end

  def maximum
    ([value] + childs.map(&:maximum)).max
  end

  def depth_of(input_value)
    if input_value == value
      1
    elsif leaf?
      0
    else
      childs.find { |child| child.include?(input_value) }.depth_of(input_value) + 1
    end
  end

  def height
    ([1] + childs.map { |child| child.height + 1 }).max
  end

  def sort
    values = childs.reduce([value]) { |sum, child| sum + child.sort }
    Sorter.new.sort(values)
  end

  def leaves_count
    if leaf?
      1
    else
      childs.reduce(0) { |sum, child| sum + child.leaves_count }
    end
  end

  def delete_child(location)
    reinserting_values = send(location).sort - [send(location).value]
    instance_variable_set(:"@#{location}", nil)
    reinserting_values.shuffle.each{|value|insert(value)}
    # reinserting_values = aim_child.sort - [aim_child.value]
    # instance_variable_set(:"@#{location}", nil)
    # reinserting_values.shuffle.each{|value|insert(value)}
  end

  def delete(input_value)
    # aim_child=childs.find{|child|child.include?(input_value)}
    # p greater_child.value
    # p'b'
    if greater_child && greater_child.value==input_value
      delete_child(:greater_child)
      # x = aim_child.sort - [aim_child.value]
      # if aim_child == greater_child
      #   @greater_child=nil
      #   x.each{|value|insert(value)}
      # else
      #   @lesser_child=nil
      #   x.each{|value|insert(value)}
      # end
    elsif lesser_child && lesser_child.value==input_value
      delete_child(:lesser_child)
    else
      childs.find{|child|child.include?(input_value)}.delete(input_value)
      # aim_child.delete(input_value)
    end


  end

  def count
    childs.reduce(1){|sum,child| sum + child.count}
  end
end
