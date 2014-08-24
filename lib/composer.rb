class Composer < ActiveRecord::Base
  validates :name, presence: true, format: { with: /[a-zA-Z]/,
    message: "This input only allows letters." }

  before_create do
    self.name = name.capitalize
  end

end
