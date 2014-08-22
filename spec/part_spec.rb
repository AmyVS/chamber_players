require 'spec_helper'

describe Part do
  it { should belong_to :piece }
  it { should have_many :roles }
end
