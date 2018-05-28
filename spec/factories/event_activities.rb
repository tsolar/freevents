FactoryBot.define do
  factory :event_activity, class: "Event::Activity" do
    type ""
    event_day_id { Event::Day.where(event: Event.last).last.try(:id) || FactoryBot.create(:event_day).id }
    title { FFaker::HipsterIpsum.sentence }
    description { FFaker::HipsterIpsum.paragraph }
    starts_at { Time.now }
    ends_at { Time.now + 30.minutes }

    trait :invalid do
      event_day_id nil
      title nil
    end
  end
end
