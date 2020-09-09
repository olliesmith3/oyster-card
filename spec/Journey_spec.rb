require 'Journey'

describe Journey do
    
    let(:journey) { Journey.new("London Bridge", "Old street") }

  it "a new instance of Journey has an entry station" do
    expect(journey.entry_station).to eq "London Bridge"
  end
  
end