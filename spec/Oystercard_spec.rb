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

  it 'allows us to deduct money from a card' do
    subject.top_up(20)
    expect { subject.deduct(7) }.to change{ subject.balance }.by -7
  end

  describe "#touch_in" do
    it 'changes instance variable to true' do
      subject.touch_in
       expect(subject.in_journey).to eq true  
    end 
  end

  describe "#touch_out" do
    it 'changes instance variable to false' do
      subject.touch_in
      subject.touch_out
      expect(subject.in_journey).to eq false  
    end 
  end

  describe "#in_journey?" do 
    it 'checking if user is in a journey' do
      subject.touch_in
      expect(subject.in_journey?).to eq true 
    end

    it 'check user isn\'t on a journey' do 
      subject.touch_in
      subject.touch_out 
      expect(subject.in_journey?).to eq false
    end
  end 


end