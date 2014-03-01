class Parse
  attr_reader :line_arr, :transaction, :name

  def initialize(line)
    @line = line
    @line_arr = line.split(' ')
  end

  def transaction
    line_arr[0].downcase
  end

  def name
    line_arr[1] 
  end
  
  def account_number
    line_arr[2].to_i 
  end

  def credit_limit
    (@line[/\$\d+/,0].delete "$").to_i
  end

  def amount
    (@line[/\$\d+/,0].delete "$").to_i
  end

end
