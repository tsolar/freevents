FactoryBot.define do
  factory :ticket do
    holder { create(:event_attendee) }

    trait :invalid do
      holder nil
    end
  end
end
