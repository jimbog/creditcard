require 'spec_helper'
require_relative '../../lib/credit_card'

describe CreditCard do
  it "is initialized with a hash" do
    cc = CreditCard.new name: "Tom", number: 4111111111111111, credit_limit: 1000
    expect(cc.name).to eq("Tom")
    expect(cc.number).to eq(4111111111111111)
  end

  it "is initialized with a balance of 0" do
    cc = CreditCard.new name: "Tom", number: 4111111111111111, credit_limit: 1000
    expect(cc.balance).to eq(0)
  end

  it "verifies validity of cc number" do
    cc = CreditCard.new name: "Tom", number: 4111111111111111
    expect(cc.valid_number?).to be_true
  end

  it "verifies validity of cc number" do
    cc = CreditCard.new name: "Quincy", number: 1234567890123456
    expect(cc.valid_number?).to be_false
  end

  it "increases the balance by the amount of charges" do
    cc = CreditCard.new name: "Tom", number: 4111111111111111, credit_limit: 1000
    cc.charge 200
    cc.charge 100
    expect(cc.balance).to eq(300)
  end

  it "ignores charges beyond the credit limit" do
    cc = CreditCard.new name: "Tom", number: 4111111111111111, credit_limit: 1000
    cc.charge 500
    cc.charge 800
    expect(cc.balance).to eq(500)
  end

  it "decreases the balance by the amount of credits" do
    cc = CreditCard.new name: "Lisa", number: 5454545454545454, credit_limit: 3000
    cc.credit 100
    expect(cc.balance).to eq(-100)
  end

  it "handles both credit and charges to the same card" do
    cc = CreditCard.new name: "Lisa", number: 5454545454545454, credit_limit: 3000
    cc.credit 100
    cc.charge 7
    expect(cc.balance).to eq(-93)
  end

end
