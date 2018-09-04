FactoryBot.define do
  factory :venue_room, class: "Venue::Room" do
    venue_id { Venue.last.try(:id) || FactoryBot.create(:venue).id }
    sequence(:name) { |n| "Room #{n}" }
    capacity 10
  end
end
