FactoryBot.define do
  factory :venue do
    name { FFaker::Venue.name }
    description { FFaker::Lorem.paragraph }
    address { FFaker::Address.street_address }
    lat -33.4489
    lng -70.6693
  end
end
