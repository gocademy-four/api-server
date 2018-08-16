FactoryBot.define do
  factory :tutor_region do
    location { Faker::Address.full_address }

    tutor
  end
end
