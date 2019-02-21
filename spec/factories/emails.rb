# frozen_string_literal: true

FactoryBot.define do
  factory :email do
    address { FFaker::Internet.email }
    emailable { create(:entity_person) }
    label { FFaker::Lorem.word }
  end
end
