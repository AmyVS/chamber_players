class Part < ActiveRecord::Base
  belongs_to :piece
  has_many :roles
  validates :instrument, presence: true
end
