# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { 'AA AA' }
    text { Faker::Lorem.words(number: 2) }
    category
    trait :post_invalid do
      title { Faker::Lorem.words(number: 2) }
      text { Faker::Lorem.words(number: 2) }
    end
  end
end
