# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    # sequence(:email) { |n| "person#{n}@example.com" }
    email { FFaker::Internet.email }
    password "password"
    password_confirmation "password"
    confirmed_at { Date.today }
  end
end
