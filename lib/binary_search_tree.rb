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

  def height
    return false if head.nil?
    head.height
  end

  def sort
    return false if head.nil?
    head.sort
  end

  def leaves_count
    return false if head.nil?
    head.leaves_count
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
end
