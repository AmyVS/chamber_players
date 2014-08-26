class Musician < ActiveRecord::Base
  has_many :parts
  belongs_to :instrument

  validates :name, presence: true, format: { with: /[a-zA-Z]/,
    message: "only allows letters." }

  before_create do
    self.name = name.capitalize
  end

  scope :find_by_instrument, -> (instrument) { where(instrument_id: instrument.id) }

end
