class Role < ActiveRecord::Base
  belongs_to :part
  belongs_to :musician
end
