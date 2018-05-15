FactoryBot.define do
  factory :ticket do
    holder { FactoryBot.create(:event_attendee) }

    trait :invalid do
      holder nil
    end
  end
end
