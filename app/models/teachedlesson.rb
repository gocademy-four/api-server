class Teachedlesson < ApplicationRecord
  belongs_to :tutor
  belongs_to :lesson
end
