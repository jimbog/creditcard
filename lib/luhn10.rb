module ExtendedArray
  refine Array do
    def even_indexes
      arr = []
      self.each_with_index { |num, index| arr << num if index.even? }
      arr
    end

    def odd_indexes
      arr = []
      self.each_with_index { |num, index| arr << num if index.odd? }
      arr
    end

    def sum
      self.inject(:+)
    end
  end
end

class Luhn10
  using ExtendedArray
  attr_reader :num_arr

  def initialize(num)
    @num = num
    @num_arr = num_to_arr(@num) 
  end

  def num_to_arr(num)
    num.to_s.split('').map { |char| char.to_i }
  end

  def double_every_other
    num_arr.reverse[1..-1].even_indexes.map do |num|
      num * 2 < 9 ? num * 2 : num_to_arr(num*2).sum
    end

  end
  def sum_of_digits
    double_every_other.sum + @num_arr.reverse[1..-1].odd_indexes.sum
  end

  def check_digit
    @num_arr.last
  end

  def valid?
    num_to_arr(sum_of_digits * 9).last == check_digit
  end
end

