class Musician < ActiveRecord::Base
  has_many :roles
  validates :name, :instrument, presence: true
  validates :name, :instrument, format: { with: /\A[a-zA-Z]+\z/,
    message: "This input only allows letters." }

end
