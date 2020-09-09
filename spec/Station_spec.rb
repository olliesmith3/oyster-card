require 'Station'

describe Station do
  it 'Checks the zone of a station can be accessed' do
    liverpool_street = Station.new("Liverpool_street", 2)
    expect(liverpool_street.zone).to eq 2
  end
end