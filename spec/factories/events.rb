# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    title { FFaker::Lorem.sentence }
    description { FFaker::Lorem.paragraph }

    days_attributes { [FactoryBot.attributes_for(:event_day)] }

    owner { create(:user) }

    # transient do
    #   # days_count 1
    #   venues_count 0
    # end

    # after(:create) do |event, evaluator|
    #   # create_list(:event_day, evaluator.days_count, event: event)
    #   create_list(:event_venue, evaluator.venues_count, event: event)
    # end

    trait :invalid do
      title { nil }
    end
  end
end
