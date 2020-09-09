class Journey

attr_reader :entry_station, :exit_station

  def initialize(station)
    @entry_station = station
    @history = []
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
    @history << { entry_station: @entry_station, exit_station: @exit_station }
    @entry_station = nil
  end

  def in_journey?
    !@entry_station.nil?
  end

  def show_history
    @history.each do |element|
      puts "Entry station: #{element[:entry_station]}, Exit station: #{element[:exit_station]}"
    end
  end

end