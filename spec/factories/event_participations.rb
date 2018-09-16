FactoryBot.define do
  factory :event_participation, class: "Event::Participation" do
    event { Event.last || create(:event) }
    # type ""
    participant { create(:entity_person) }
    # association :participant, factory: :entity_person # , strategy: :build
    description { FFaker::Lorem.paragraph }

    trait :invalid do
      event nil
      participant nil
    end

    factory :event_attendee, class: "Event::Attendee" do
    end
  end
end
