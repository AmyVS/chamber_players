require 'spec_helper'

describe Part do
  it { should belong_to :musician }
  it { should belong_to :piece }
  it { should validate_presence_of :instrument }

  it 'downcases an instrument input before it is created' do
    part = Part.create(instrument: 'BASSOON', piece_id: 1, musician_id: 1)
    expect(part.instrument).to eq 'bassoon'
  end

end
