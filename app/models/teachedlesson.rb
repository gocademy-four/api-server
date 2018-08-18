class Teachedlesson < ApplicationRecord
  has_many :order
  belongs_to :tutor
  belongs_to :lesson
end
