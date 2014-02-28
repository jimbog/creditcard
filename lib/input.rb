# encoding: UTF-8
require_relative 'credit_card'
require_relative 'parse'

accounts = []



loop do
  text = gets
  text = Parse.new(text)

  case text.transaction
  when "add"
    accounts <<  CreditCard.new(name: name, number: number, credit_limit: credit_limit)
    puts 'account created'

  when /^[Cc]redit\s+\w+\s+\$\d+\n/
    puts "begin credit transaction"
    name = text.split(' ')[1]
    amount = text.split(' ')[2][1..-1].to_i

    cc = accounts.find { |account| account.name == name }
    cc.credit(amount)
    puts "the new balance is #{cc.balance}"

  when /^[Cc]harge\s+\w+\s+\$\d+\n/
    puts "begin charge transaction"
    name = text.split(' ')[1]
    amount = text.split(' ')[2][1..-1].to_i
    puts amount.class

    cc = accounts.find { |account| account.name == name }
    cc.charge(amount)
    puts "the new balance is #{cc.balance}"
  end

  p accounts

end


