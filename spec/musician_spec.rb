require 'spec_helper'

describe Musician do
  it { should have_many :roles }
  it { should validate_presence_of :name }
end
