class Sorter
  def sort(array)
    sort_while_traveling(array)
    array
  end

  def sort_while_traveling(array)
    1.upto(array.size - 1) { |count| sort_number(array, count) }
  end

  def sort_number(array, count)
    count.times { |pos| insert_at_place(array, count, pos) }
  end

  def insert_at_place(array, count, pos)
    array.insert(pos, array.delete_at(count)) if array[count] < array[pos]
  end
end
