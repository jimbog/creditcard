require 'spec_helper'
require_relative '../../lib/credit_card'

describe CreditCard do
  describe "initialization" do
    let(:cc){ CreditCard.new name: "Tom", number: 4111111111111111, credit_limit: 1000 }
    it "is initialized with a hash" do
      expect(cc.name).to eq("Tom")
      expect(cc.number).to eq(4111111111111111)
    end

    it "is initialized with a balance of 0" do
      expect(cc.balance).to eq(0)
    end
  end

  describe "validation" do
    context "when given a correct cc number" do
      it "it returns true" do
        cc = CreditCard.new name: "Tom", number: 4111111111111111
        expect(cc.valid_number?).to be_true
      end
    end

    context "when given an incorrect cc number" do
      it "returns false if failing luhn10 sum" do
        cc = CreditCard.new name: "Quincy", number: 1234567890123456
        expect(cc.valid_number?).to be_false
      end
      
      it "returns false if exceeds 19 digits" do
        cc = CreditCard.new name: "Quincy", number: 12345678901234567890
        expect(cc.valid_number?).to be_false
      end
    end
  end

  describe "transactions" do
    let(:cc){ CreditCard.new name: "Tom", number: 4111111111111111, credit_limit: 1000 }

    it "increases the balance by the amount of charges" do
      cc.charge 200
      cc.charge 100
      expect(cc.balance).to eq(300)
    end

    it "ignores charges beyond the credit limit" do
      cc.charge 500
      cc.charge 800
      expect(cc.balance).to eq(500)
    end

    it "decreases the balance by the amount of credits" do
      cc.credit 100
      expect(cc.balance).to eq(-100)
    end

    it "handles both credit and charges to the same card" do
      cc.credit 100
      cc.charge 7
      expect(cc.balance).to eq(-93)
    end
  end

end
