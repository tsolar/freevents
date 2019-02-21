# frozen_string_literal: true

FactoryBot.define do
  factory :event_activity, class: "Event::Activity" do
    activity_type { Event::Activity::Postulation::ACTIVITY_TYPES.sample }
    event_day_id { Event::Day.where(event: Event.last).last.try(:id) || create(:event_day).id }
    title { FFaker::HipsterIpsum.sentence }
    description { FFaker::HipsterIpsum.paragraph }
    starts_at { Event::Day.find_by(id: event_day_id).try(:starts_at) }
    ends_at { Event::Day.find_by(id: event_day_id).try(:ends_at) }

    trait :invalid do
      title { nil }
    end
  end
end
