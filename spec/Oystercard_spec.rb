require 'oystercard'
require 'Journey'

describe Oystercard do

  let(:oyster)            {   Oystercard.new  }
  let(:liverpool_street)  { "liverpool_street"  }
  let(:bow_road)          { "bow_road"   }

  it  "checks that the balance of oyster card is equal to the defualt" do
  expect(oyster.balance).to eq (15)
  end

  it "checks that you can top up the card with a specific value" do
  expect {oyster.top_up(10)}.to change{oyster.balance}.by 10
  end

  it "sends an error message if the card is topped up with more than £90" do
    expect {oyster.top_up(76)}.to raise_error "Limit is £90"
  end

  it "checks that you can deduct money from the balance" do
    expect {oyster.touch_out(bow_road, 10)}.to change{oyster.balance}.by -10
  end

  describe 'touch_in' do
    it "checks that the oyster card has been touched in" do
      oyster.touch_in(liverpool_street)
      expect(oyster.in_journey?).to eq true
    end

    it 'won\'t allow me to touch in if the balance is less than £1' do
      cloyster = Oystercard.new(0)
      expect { cloyster.touch_in(liverpool_street) }.to raise_error "Minimum fare is £1"
    end

    it 'remembers the station it touched in at' do
      oyster.touch_in(liverpool_street)
      expect(oyster.entry_station).to eq liverpool_street
    end
  end

  describe 'touch out' do
    it "checks that the oyster card has been touched out" do
      oyster.touch_in(liverpool_street)
      oyster.touch_out(bow_road)
      expect(oyster.in_journey?).to eq false
    end
    it "checks that the balance has been deducted by the minimum fare" do
      oyster.touch_in(liverpool_street)
      expect { oyster.touch_out(bow_road, Oystercard::MINIMUM_FARE) }.to change{oyster.balance}.by -Oystercard::MINIMUM_FARE
    end

    it 'forgets the entry station when it touches out' do
      oyster.touch_in(liverpool_street)
      oyster.touch_out(bow_road)
      expect(oyster.entry_station).to eq nil
    end
  end

  describe 'in_journey?' do
    it "checks whether the card is in use or not" do
      oyster.touch_in(liverpool_street)
      expect(oyster.in_journey?).to be_truthy
    end

    it "checks whether the card is in use or not" do
      oyster.touch_out(bow_road)
      expect(oyster.in_journey?).to be_falsey
    end
  end

  it 'checks that @history is empty by default' do
    expect(subject.history).to eq []
  end
  
  let(:journey) { {entry_station: liverpool_street, exit_station: bow_road} }

  it 'checks that a journey has been added to the history' do
    oyster.touch_in(liverpool_street)
    oyster.touch_out(bow_road)
    expect(oyster.history).to include journey
  end

  describe 'show history' do
    it "lists the entry and exit stations" do
      oyster.touch_in(liverpool_street)
      oyster.touch_out(bow_road)
      expect { oyster.show_history }.to output("Entry station: liverpool_street, Exit station: bow_road\n").to_stdout
    end
  end
end