class Oystercard

  attr_reader :balance, :entry_station, :exit_station, :history

  DEFAULT_VALUE = 15
  DEFAULT_LIMIT = 90
  MINIMUM_FARE = 1


  def initialize(balance = DEFAULT_VALUE)
    @balance = balance
    @history = []
  end

  def top_up(amount)
    fail "Limit is £#{DEFAULT_LIMIT}" if @balance + amount > DEFAULT_LIMIT
    @balance += amount
  end

  def touch_in(station)
    fail "Minimum fare is £#{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    @entry_station = station
    Journey.new(station)
  end

  def touch_out(station, amount = MINIMUM_FARE)
    deduct(amount)
    @history << Journey.new(@entry_station).finish_journey(station)
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
