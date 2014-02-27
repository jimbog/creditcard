require_relative 'luhn10'

class CreditCard
  attr_reader :name, :number, :credit_limit, :balance, :valid_number

  def initialize options = {}
    @name = options[:name]
    @number = options[:number]
    @credit_limit = options[:credit_limit] || 0
    @balance =  0
  end

  def valid_number?
    test = Luhn10.new @number
    test.valid?
  end

  def charge(amount)
      if @balance + amount > @credit_limit
        #raise error
      else
        @balance += amount
      end
  end

  def credit(amount)
      @balance -= amount
  end

end
