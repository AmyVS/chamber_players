require 'spec_helper'

describe Piece do
  it { should have_many :parts }
  it { should validate_presence_of :title }
  it { should validate_presence_of :composer }
  it { should validate_presence_of :number_of_parts }
end
