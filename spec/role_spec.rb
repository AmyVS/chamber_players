require 'spec_helper'

describe Role do
  it { should belong_to :part }
  it { should belong_to :musician }
end
