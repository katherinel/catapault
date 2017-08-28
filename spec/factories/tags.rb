require 'faker'

FactoryGirl.define do
  factory :tag do
    label { Faker::Lovecraft.words(1) }

    trait :include_breeds do
      after(:create) do |tag|
        tag.breeds << FactoryGirl.create(:breed)
      end
    end
  end
end
