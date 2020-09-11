class Journey

attr_reader :entry_station, :exit_station

PENALTY_FARE = 6

  def initialize(station = nil)
    @entry_station = station
  end

  def finish(exit_station)
    @exit_station = exit_station
    { entry_station: @entry_station, exit_station: @exit_station }
  end
end