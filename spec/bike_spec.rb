# spec/bike_spec.rb
require 'bike'
describe Bike do
  context 'Bike responds to method to check if it is working'
  it { is_expected.to respond_to :working? }
end

# context 'Bike can self-identify as working'
# describe Bike.new.working? do
#   #described_class.new.working?
#     it { is_expected.to be true }
# end
