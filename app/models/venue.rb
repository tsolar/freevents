class Venue < ApplicationRecord
  has_many :event_venues,
           class_name: "Event::Venue"
  has_many :events,
           class_name: "Event",
           through: :event_venues

  validates :name, presence: true
  validates :address, presence: true
end
