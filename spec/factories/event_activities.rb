FactoryBot.define do
  factory :event_activity, class: "Event::Activity" do
    type { "" }
    event_day { Event::Day.last || FactoryBot.create(:event_day) }
    title { FFaker::HipsterIpsum.sentence }
    description { FFaker::HipsterIpsum.paragraph }
    starts_at { Time.now }
    ends_at { Time.now + 30.minutes }
  end
end
