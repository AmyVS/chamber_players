require 'spec_helper'

describe Piece do
  it { should have_many :parts }
  it { should validate_presence_of :title }
end
