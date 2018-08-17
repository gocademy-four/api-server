FactoryBot.define do
  factory :tutor do
    member
<<<<<<< HEAD

    factory :tutor_with_tutor_regions do
      transient do
        tutor_regions_count { 3 }
      end

      after(:create) do |tutor, evaluator|
        create_list(:tutor_region, evaluator.tutor_regions_count, tutor: tutor)
      end
    end
=======
>>>>>>> 7ef62a5dfc61886f11c267428a3cf5ecf3018076
  end
end
