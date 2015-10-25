require 'sorter'

class SorterTest < Minitest::Test
  def test_it_exists
    assert Sorter
  end

  def test_it_takes_an_array
    assert Sorter.new.sort([])
  end

  def test_it_sorts_empty_string
    array = []
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sorts_single_element_string
    array = [5]
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sorts_even_elements
    array = [7, 3, 6, 1]
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sorts_odd_elements
    array = [8, 2, 7, 1, 0]
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sorts_numbers
    array = (1..100).to_a.sample(30)
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sortes_characters
    array = %w( t s l d c b e i a)
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sorts_reversed_arrays
    array = [7, 6, 4, 2, 1]
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sorts_presorted_arrays
    array = [3, 5, 7, 9, 22]
    assert_equal array.sort, Sorter.new.sort(array)
  end

  def test_it_sorts_duplicated_arrays
    array = [8, 2, 7, 1, 0] * 2
    assert_equal array.sort, Sorter.new.sort(array)
  end
end
