require 'spec_helper'

describe Piece do
  it { should have_many :parts }
  it { should validate_presence_of :title }
  it { should validate_presence_of :composer }
  it { should validate_presence_of :number_of_parts }

  it 'ensures that the composer only accepts letters' do
    piece = Piece.create(title: 'Toccata and Fugue', composer: 12, number_of_parts: 4)
    expect(piece.save).to eq false
  end

  it 'ensures that the composer only accepts letters' do
    piece = Piece.create(title: 'Toccata and Fugue', composer: 'Bach', number_of_parts: 4)
    expect(piece.save).to eq true
  end

  it 'ensures that the number_of_parts only accepts integers' do
    piece = Piece.create(title: 'Toccata and Fugue', composer: 'Bach', number_of_parts: 'four')
    expect(piece.save).to eq false
  end

  it 'ensures that the number_of_parts only accepts integers' do
    piece = Piece.create(title: 'Toccata and Fugue', composer: 'Bach', number_of_parts: 4)
    expect(piece.save).to eq true
  end

  it 'downcases a title input before it is created' do
    piece = Piece.create(title: 'Toccata AND Fugue', composer: 'Bach', number_of_parts: 4)
    expect(piece.title).to eq 'toccata and fugue'
  end

  it 'capitalizes composer input before it is created' do
    piece = Piece.create(title: 'toccata and fugue', composer: 'BACH', number_of_parts: 4)
    expect(piece.composer).to eq 'Bach'
  end

  # it 'should return all pieces by a specific composer' do
  #   piece1 = Piece.create(title: 'maple leaf rag', composer: 'Joplin', number_of_parts: 4)
  #   piece2 = Piece.create(title: 'the entertainer', composer: 'Joplin', number_of_parts: 4)
  #   piece3 = Piece.create(title: 'toccata and fugue', composer: 'Bach', number_of_parts: 5)
  #   expect(Piece.find_by_composer).to eq [piece1, piece2]
  # end

end
