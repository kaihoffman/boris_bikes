# lib/docking_station.rb
require './lib/bike'

class DockingStation
  attr_reader :docked_bikes

def initialize(docked_bikes = Array.new)
  @docked_bikes = docked_bikes
end

  def release_bike
    fail "No bikes!" if @docked_bikes.count == 0
    @docked_bikes.pop
  end

  def dock (bike)
    fail "I'm full!" if @docked_bikes.count >= 20
    @docked_bikes.push(bike)
  end

end
