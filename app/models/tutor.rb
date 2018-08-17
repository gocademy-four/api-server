class Tutor < ApplicationRecord
  has_many :tutor_regions
  belongs_to :member
end
