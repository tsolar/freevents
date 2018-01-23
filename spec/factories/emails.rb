FactoryBot.define do
  factory :email do
    address { FFaker::Internet.email }
    emailable { FactoryBot.create(:entity_person) }
    label { FFaker::Lorem.word }
  end
end
