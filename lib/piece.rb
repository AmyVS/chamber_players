class Piece < ActiveRecord::Base
  has_many :parts
  belongs_to :composer

  validates :title, presence: true

  validates :number_of_parts, presence: true, :numericality => { only_integer: true }

  before_create do
    self.title = title.downcase
  end

  # scope :find_by_composer, -> { where(composer: composer)}

  # def self.find_by_composer(composer)
  #   where(composer: composer)
  # end

end
