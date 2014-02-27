# encoding: UTF-8

loop do
  @text = gets.chomp
  if /^[Aa]dd\s+/ =~ @text
    name = @text.split(' ')[1]
    puts "create credit card with name: #{name}"
  elsif /^[Cc]redit\s+\$/ =~ @text
    puts "begin credit transaction"
  elsif /^[Cc]harge\s+\$/ =~ @text
    puts "begin credit transaction"
  end
  
end
