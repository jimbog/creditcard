module ExtendArrary
  refine Array do
    def refined
      self << "refined"
    end

    def each_even
      arr = []
      self.each_with_index { |num, index| arr << num if index.even? }
      arr
    end
  end
end

using ExtendArrary
p (0..10).to_a.each_even
p [1,2,3].refined
