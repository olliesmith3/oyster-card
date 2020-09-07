require 'Oystercard'

describe Oystercard do
  it 'checks starting balance is 0' do
    expect(subject.balance).to eq 0 
  end 
end 