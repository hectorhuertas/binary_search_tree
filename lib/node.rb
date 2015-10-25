require 'sorter'

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
end
