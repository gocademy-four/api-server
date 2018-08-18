FactoryBot.define do
  factory :customer do
    member

    factory :customer_with_orders do
      transient do
        order_count { 3 }
      end

      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.order_count, customer: customer)
      end
    end
  end
end
