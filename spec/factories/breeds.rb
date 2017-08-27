require 'faker'

FactoryGirl.define do
  factory :breed do
    name { Faker::Cat.breed }
  end
end
