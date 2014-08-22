require 'spec_helper'

describe Musician do
  it { should have_many :roles }
  it { should validate_presence_of :name }
  it { should validate_presence_of :instrument }

  it 'ensures that the name only accepts letters' do
    musician = Musician.create(name: 12, instrument: 'bassoon')
    expect(musician.save).to eq false
  end

  it 'ensures that the instrument only accepts letters' do
    musician = Musician.create(name: 'Chris', instrument: 12)
    expect(musician.save).to eq false
  end

end
