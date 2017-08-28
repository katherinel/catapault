require 'faker'

FactoryGirl.define do
  factory :breed do
    name { Faker::Cat.breed }

    trait :include_tags do
      after(:create) do |breed|
        breed.tags << FactoryGirl.create(:tag)
      end
    end
  end
end
