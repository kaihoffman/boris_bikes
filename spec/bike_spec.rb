# spec/bike_spec.rb
require 'bike'

RSpec::Matchers.define :be_boolean do
  match do |value|
    [true, false].include? value
  end
end

describe Bike do
  it 'Bike responds to method to check if it is working' do
  expect(subject).to respond_to(:working?)
end

it 'sets a default instance variable of bike working' do
  expect(subject.working?).to be_boolean
end

end

# context 'Bike can self-identify as working'
# describe Bike.new.working? do
#   #described_class.new.working?
#     it { is_expected.to be true }
# end
