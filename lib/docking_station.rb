# lib/docking_station.rb
require './lib/bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  attr_reader :docked_bikes

  def initialize(capacity = DEFAULT_CAPACITY)
  @docked_bikes = Array.new
  @capacity = capacity
end

  def release_bike
    fail "No bikes!" if empty?
    @docked_bikes.pop
  end

  def dock (bike)
      fail "I'm full!" if full?
      @docked_bikes.push(bike)
      end
  end

private

  def full?
    if @docked_bikes.count >= DockingStation::DEFAULT_CAPACITY
      true
    end
  end

  def empty?
    if @docked_bikes.count == 0
      true
    end
  end
