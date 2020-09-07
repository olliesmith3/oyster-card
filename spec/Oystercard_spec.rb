require 'Oystercard'

describe Oystercard do
  it 'checks starting balance is 0' do
    expect(subject.balance).to eq 0 
  end 

  it 'adds money to the card' do
    expect { subject.top_up(10) }.to change(subject, :balance).by(10)
  end

  it 'throws error if we topup beyond £90' do
    expect {subject.top_up(100)}.to raise_error "Limit is £90"
  end 
end 