require_relative 'node'
require_relative 'file_io'

class BinarySearchTree
  attr_reader :head, :file_io

  def initialize
    @file_io = FileIO.new
  end

  def insert(value)
    if head.nil?
      @head = Node.new(value)
    else
      head.insert(value)
    end
  end

  def include?(value)
    head.include?(value) if head
  end

  def maximum
    head.maximum if head
  end

  def minimum
    head.minimum if head
  end

  def depth_of(value)
    head.depth_of(value) if head
  end

  def height
    head.height if head
  end

  def sort
    head.sort if head
  end

  def leaves_count
    head.leaves_count if head
  end

  def sort_file
    input = file_io.read
    output = sort_file_data(input)
    file_io.write(output)
  end

  def sort_file_data(input)
    input.split.each { |element| insert(element) }
    sort.join("\n")
  end

  def count
    return 0 if head.nil?
    head.count
  end

  def delete_head
    reinserting_values = head.sort - [head.value]
    @head = nil
    reinserting_values.shuffle.each { |value| insert(value) }
  end

  def delete(input)
    return false if head.nil?
    if head.value == input
      delete_head
    else
      head.delete(input)
    end
  end
end
