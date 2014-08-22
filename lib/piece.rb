class Piece < ActiveRecord::Base
  has_many :parts

  validates :title, presence: true, format: { with: /[a-zA-Z]/,
    message: "This input only allows letters." }

  validates :composer, presence: true, format: { with: /[a-zA-Z]/,
    message: "This input only allows letters." }

  validates :number_of_parts, presence: true


  # validates :number_of_parts, format: { with: /[0-9]/,
  #   message: "This input only allows numbers."}

end
