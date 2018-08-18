FactoryBot.define do
  factory :teachedlesson do
    price_per_hour 1
    tutor
    lesson

    factory :teachedlesson_with_orders do
      transient do
        orders_count { 3 }
      end

      after(:create) do |teachedlesson, evaluator|
        create_list(:order, evaluator.orders_count, teachedlesson: teachedlesson)
      end
    end
  end
end
