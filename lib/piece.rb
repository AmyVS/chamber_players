class Piece < ActiveRecord::Base
  has_many :parts
  validates :title, :composer, :number_of_parts, presence: true
  validates :title, format: { with: /\A[a-zA-Z]+\z/,
    message: "This input only allows letters." }

end
