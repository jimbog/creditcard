require 'spec_helper'
require_relative '../../lib/luhn10'

describe Luhn10 do
  it "converts a number to an array" do
    number = Luhn10.new 12345
    expect(number.num_arr).to eq([1, 2, 3, 4, 5])
  end

  it "doubles every other number starting from the penultimate" do
    number = Luhn10.new 12345
    expect(number.double_every_other).to eq([8, 4])
  end

  it "adds the digits of the doubling if the number is greater than nine" do
    number = Luhn10.new 5678
    expect(number.double_every_other).to eq([5, 1])
  end

  it "adds all the numbers after doubling is applied" do
    number = Luhn10.new 79927398713
    expect(number.sum_of_digits).to eq(67)
  end

  context "when valid number is passed" do
    it "it returns true" do
      number = Luhn10.new 79927398713
      expect(number.valid?).to be_true
    end
  end

  context "when invalid number is passed" do
    it "returns false" do
      number = Luhn10.new 79927398714
      expect(number.valid?).to be_false
    end
  end
end
