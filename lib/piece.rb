class Piece < ActiveRecord::Base
  has_many :parts

  validates :title, presence: true, format: { with: /[a-zA-Z]/,
    message: "This input only allows letters." }

  validates :composer, presence: true, format: { with: /[a-zA-Z]/,
    message: "This input only allows letters." }

  validates :number_of_parts, presence: true, :numericality => { only_integer: true }

end
