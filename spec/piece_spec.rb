require 'spec_helper'

describe Piece do
  it { should have_many :parts }
  it { should validate_presence_of :title }
  it { should validate_presence_of :composer }
  it { should validate_presence_of :number_of_parts }

  it 'ensures that the title only accepts letters' do
    piece = Piece.create(title: 12, composer: 'Bach', number_of_parts: 4)
    expect(piece.save).to eq false
  end

  it 'ensures that the composer only accepts letters' do
    piece = Piece.create(title: 'Toccata and Fugue', composer: 12, number_of_parts: 4)
    expect(piece.save).to eq false
  end

end
