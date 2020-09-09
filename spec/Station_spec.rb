require 'Station'

describe Station do

  liverpool_street = Station.new("Liverpool_street", 2)
  
  it 'Checks the zone of a station can be accessed' do
    expect(liverpool_street.zone).to eq 2
  end

  it 'Checks the name of a station can be accessed' do
    expect(liverpool_street.name).to eq "Liverpool_street"
  end
end