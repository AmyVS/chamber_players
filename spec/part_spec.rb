require 'spec_helper'

describe Part do
  it { should belong_to :piece }
  it { should have_many :roles }
  it { should validate_presence_of :instrument }

  it 'downcases an instrument input before it is created' do
    part = Part.create(instrument: 'BASSOON', piece_id: 1)
    expect(part.instrument).to eq 'bassoon'
  end

end
