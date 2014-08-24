class Musician < ActiveRecord::Base
  has_many :roles

  validates :name, presence: true, format: { with: /[a-zA-Z]/,
    message: "only allows letters." }

  before_create do
    self.name = name.capitalize
  end

end
