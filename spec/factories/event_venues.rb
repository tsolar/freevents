FactoryBot.define do
  factory :event_venue, class: "Event::Venue" do
    event
    venue
  end
end
