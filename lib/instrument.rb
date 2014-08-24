class Instrument < ActiveRecord::Base
  validates :name, presence: true, format: { with: /[a-zA-Z]/,
    message: "only allows letters." }

  before_create do
    self.name = name.downcase
  end

end
