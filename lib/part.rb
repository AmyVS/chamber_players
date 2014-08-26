class Part < ActiveRecord::Base
  belongs_to :piece
  belongs_to :musician

  validates :instrument, presence: true

  before_create do
    self.instrument = instrument.downcase
  end

end
