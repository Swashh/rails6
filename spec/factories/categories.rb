# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    title { 'AA AA' }
    text { Faker::Lorem.words(number: 2) }

    trait :category_invalid do
      title { Faker::Lorem.words(number: 2) }
      text { Faker::Lorem.words(number: 2) }
    end
  end
end
