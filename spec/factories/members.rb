FactoryBot.define do
  factory :member do
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password }

    name { Faker::Name.name }
    phone_number { Faker::PhoneNumber.cell_phone }
    gender { Faker::Gender.binary_type }
  end
end
