class Journey

attr_reader :entry_station, :exit_station



  def initialize(entry_station, exit_station)
    @entry_station, @exit_station = entry_station, exit_station
    @history = []
  end

  def start_journey
    @entry_station = station
  end

  def start_journey
    { entry_station: @entry_station, exit_station: @exit_station }
  end

end