FactoryBot.define do
  factory :event_participation_answer, class: "Event::Participation::Answer" do
    event_participation { FactoryBot.create(:event_attendee) }
    will_attend nil
    did_attend false

    trait :yes do
      will_attend "yes"
    end

    trait :no do
      will_attend "no"
    end

    trait :maybe do
      will_attend "maybe"
    end
  end
end