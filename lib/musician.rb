class Musician < ActiveRecord::Base
  has_many :roles
  validates :name, :instrument, presence: true
end
