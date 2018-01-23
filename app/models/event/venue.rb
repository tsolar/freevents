class Event::Venue < ApplicationRecord
  belongs_to :event,
             class_name: "Event"
  belongs_to :venue,
             class_name: "::Venue"

  validates :event, presence: true
  validates :venue, presence: true
end
