class Composer < ActiveRecord::Base
  has_many :pieces

  validates :name, presence: true, format: { with: /[a-zA-Z]/,
    message: "only allows letters." }

  before_create do
    self.name = name.capitalize
  end

end
