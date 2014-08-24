require 'spec_helper'

describe Instrument do
  it { should validate_presence_of :name }

  it 'ensures that the name only accepts letters' do
    instrument = Instrument.create(name: 42)
    expect(instrument.save).to eq false
  end

  it 'ensures that the name only accepts letters' do
    instrument = Instrument.create(name: 'bassoon')
    expect(instrument.save).to eq true
  end

  it 'downcases a name input before it is created' do
    instrument = Instrument.create(name: 'BASSOON')
    expect(instrument.name).to eq 'bassoon'
  end
end
