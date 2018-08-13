class Member < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :phone_number, presence: true  # , length: { maximum: 11 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
