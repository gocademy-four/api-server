class Tutor < ApplicationRecord
  has_many :tutor_regions
  has_many :teachedlessons
  belongs_to :member
end
