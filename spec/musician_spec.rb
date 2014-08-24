require 'spec_helper'

describe Musician do
  it { should have_many :roles }
  it { should belong_to :instrument }
  it { should validate_presence_of :name }

  it 'ensures that the name only accepts letters' do
    musician = Musician.create(name: 12, instrument_id: 1)
    expect(musician.save).to eq false
  end

  it 'ensures that the name only accepts letters' do
    musician = Musician.create(name: 'Chris', instrument_id: 1)
    expect(musician.save).to eq true
  end

  it 'capitalizes a name input before it is created' do
    musician = Musician.create(name: 'chris', instrument_id: 1)
    expect(musician.name).to eq 'Chris'
  end

  it 'should return all musicians who play a specific instrument' do
    instrument = Instrument.create(name: 'french horn')
    musician1 = Musician.create(name: 'Amy', instrument_id: instrument.id)
    musician2 = Musician.create(name: 'Chris', instrument_id: 'bassoon')
    musician3 = Musician.create(name: 'Leander', instrument_id: instrument.id)
    expect(Musician.find_by_instrument(instrument)).to eq [musician1, musician3]
  end
end
