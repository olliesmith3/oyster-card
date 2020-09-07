class Oystercard
attr_reader :balance, :in_journey  
Limit = 90 
MINIMUM_FARE = 1
  def initialize
      @balance = 0
      @in_journey = false
  end

  def top_up(amount)
    raise "Limit is £#{Limit}" if @balance + amount > Limit 
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "Your balance is below the minimum fare" if @balance < MINIMUM_FARE
    @in_journey = true
  end 

  def touch_out
    @in_journey = false
  end 

  def in_journey?
    @in_journey
  end 

end