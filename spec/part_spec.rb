require 'spec_helper'

describe Part do
  it { should belong_to :piece }
  it { should have_many :roles }
  it { should validate_presence_of :instrument }

  it 'ensures that the instrument only accepts letters' do
    part = Part.create(instrument: 12, piece_id: 1)
    expect(part.save).to eq false
  end

end
