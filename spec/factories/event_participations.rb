FactoryBot.define do
  factory :event_participation, class: "Event::Participation" do
    event { Event.last || FactoryBot.create(:event) }
    type { "" }
    # participant { FactoryBot.create(:entity_person) }
    association :participant, factory: :entity_person # , strategy: :build
    description { FFaker::Lorem.paragraph }
  end
end
