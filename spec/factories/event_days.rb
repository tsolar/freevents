# frozen_string_literal: true

FactoryBot.define do
  factory :event_day, class: "Event::Day" do
    event
    starts_at { Date.tomorrow + 2.hours }
    ends_at { Date.tomorrow + 3.hours }
  end
end
