class Piece < ActiveRecord::Base
  has_many :parts
  validates :title, :composer, presence: true
end
