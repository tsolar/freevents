FactoryBot.define do
  factory :event_day, class: "Event::Day" do
    event
    starts_at { DateTime.tomorrow + 2.hours }
    ends_at { DateTime.tomorrow + 3.hours }
  end
end
