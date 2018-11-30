# frozen_string_literal: true

FactoryBot.define do
  factory :venue do
    sequence(:name) { |n| "Venue #{n}" }
    description { FFaker::Lorem.paragraph }
    address { FFaker::Address.street_address }
    lat { -33.4489 }
    lng { -70.6693 }
  end
end
