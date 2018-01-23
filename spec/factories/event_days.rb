FactoryBot.define do
  factory :event_day, class: "Event::Day" do
    event
    date { Date.tomorrow }
    start_time { DateTime.tomorrow + 2.hours }
    end_time { DateTime.tomorrow + 3.hours }
  end
end
