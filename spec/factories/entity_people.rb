# frozen_string_literal: true

FactoryBot.define do
  factory :entity_person, class: "Entity::Person" do
    firstname { FFaker::NameMX.first_name }
    lastname { FFaker::NameMX.last_name }
    dob { Date.today - Random.rand(18..40).years }
    bio { FFaker::HipsterIpsum.paragraph[0..298] }
    # user can be nil?, if managing persons without registered users
    user
  end
end
