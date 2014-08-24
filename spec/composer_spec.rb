require 'spec_helper'

describe Composer do
  it { should validate_presence_of :name }

  it 'ensures that the composer only accepts letters' do
    composer = Composer.create(name: 42)
    expect(composer.save).to eq false
  end

  it 'ensures that the composer only accepts letters' do
    composer = Composer.create(name: 'Bach')
    expect(composer.save).to eq true
  end

  it 'capitalizes composer input before it is created' do
    composer = Composer.create(name: 'BACH')
    expect(composer.name).to eq 'Bach'
  end

end
