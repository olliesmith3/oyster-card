class Oystercard
attr_reader :balance  
Limit = 90 
  def initialize
      @balance = 0
  end

  def top_up(amount)
    raise "Limit is £#{Limit}" if @balance + amount > Limit 
    @balance += amount
  end
  
end