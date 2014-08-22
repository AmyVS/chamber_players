class Musician < ActiveRecord::Base
  has_many :roles
  validates :name, :instrument, presence: true
  validates :name, format: { with: /\A[a-zA-Z]+\z/,
    message: "This input only allows letters." }

end
