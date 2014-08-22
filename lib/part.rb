class Part < ActiveRecord::Base
  belongs_to :piece
  has_many :roles

  validates :instrument, presence: true

  validates :instrument, format: { with: /[a-zA-Z]/,
    message: "This input only allows letters." }

end
