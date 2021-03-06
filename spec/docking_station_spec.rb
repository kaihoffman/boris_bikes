# spec/boris_bikes_spec.rb
require 'docking_station'

describe DockingStation do
  context 'DockingStation responds to method release_bike'
  it { is_expected.to respond_to :release_bike }

# context 'Release bike returns a new bike to use'
# station = described_class.new
# station.dock(Bike.new)
# bike = station.release_bike
# it { is_expected.to be_working}

context 'Allow for docking of a bike into docking station'
  it { is_expected.to respond_to :dock }

context 'Instance of bike class is passed to dock method'
biketest = Bike.new
station = described_class.new
station.dock(biketest)
fullstation = described_class.new
DockingStation::DEFAULT_CAPACITY.times { fullstation.dock(Bike.new) }

it 'checks that the returned bike corresponds to the instance bike' do
expect(station.docked_bikes[0]).to eq biketest
end

it 'checks that a bike is present' do
  expect(station.docked_bikes[0]).to be_an_instance_of(Bike)
end

it 'gives an error if new bike is attempted to be released but none are available' do
expect { described_class.new.release_bike }.to raise_error('No bikes!')
end

it 'gives an error if bike is attempted to be docked to full dock' do
expect { fullstation.dock(Bike.new) }.to raise_error("I'm full!")
end

it 'removes a bike from the docking station array on release' do
fullstation.release_bike
expect(fullstation.docked_bikes.count).to eq 19
end

it 'allows for Capacity to be called and returns an integer value' do
expect(station.instance_variable_get(:@capacity)).to be_kind_of(Integer)
end

it 'allows Capacity to be set to arbitrary integer value' do
  station2 = described_class.new(25)
  expect(station2.instance_variable_get(:@capacity)).to eq(25)
end

it 'makes Capacity default to DEFAULT_CAPACITY when no arg passed' do
  expect(station.instance_variable_get(:@capacity)).to eq(DockingStation::DEFAULT_CAPACITY)
end

end
