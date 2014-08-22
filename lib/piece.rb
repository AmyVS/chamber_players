class Piece < ActiveRecord::Base
  has_many :parts
  validates :title, :composer, :number_of_parts, presence: true
end
