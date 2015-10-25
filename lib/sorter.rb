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

class Sorter
  def sort(array)
    1.upto(array.size - 1) do |count|
      count.times do |pos|
        array.insert(pos, array.delete_at(count)) if array[count] < array[pos]
      end
    end
    array
  end
end
