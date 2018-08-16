FactoryBot.define do
  factory :tutor do
    member

    factory :tutor_with_tutor_regions do
      transient do
        tutor_regions_count { 3 }
      end

      after(:create) do |tutor, evaluator|
        create_list(:tutor_region, evaluator.tutor_regions_count, tutor: tutor)
      end
    end
  end
end
