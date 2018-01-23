FactoryBot.define do
  factory :entity_organization, class: "Entity::Organization" do
    type ""
    name { FFaker::Company.name }

    trait :invalid do
      name nil
    end
  end
end
