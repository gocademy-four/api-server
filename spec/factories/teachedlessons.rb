FactoryBot.define do
  factory :teachedlesson do
    price_per_hour 1
    tutor
    lesson
  end
end
