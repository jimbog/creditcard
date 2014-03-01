require 'spec_helper'
require_relative '../../lib/parse'

describe Parse do
  context "Initialization" do
    let(:line) { Parse.new("  Add Tom 123 $4000 ")}

    it "parses the transaction ignoring the letter case" do
      expect(line.transaction).to eq("add")
    end

    it "parses the name keeping the letter case" do
      expect(line.name).to eq("Tom")
    end
  end

  context "Transactions" do
    context "when it's an add" do
      let(:line) { Parse.new("add tom 123 $4000")}

      it "returns an account number" do
        expect(line.account_number).to eq(123)
      end

      it "returns a credit limit" do
        expect(line.credit_limit).to eq(4000)
      end
    end

    context "when it's a charge" do
      let(:line) { Parse.new("charge tom $100")}
      it "returns an amount" do
        expect(line.amount).to eq(100)
      end
    end
    
    context "when it's a credit" do
      let(:line) { Parse.new("credit tom $100")}
      it "returns an amount" do
        expect(line.amount).to eq(100)
      end
    end
  end

end
