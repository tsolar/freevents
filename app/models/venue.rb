# frozen_string_literal: true

class Venue < ApplicationRecord
  has_many :event_venues,
           class_name: "Event::Venue"
  has_many :events,
           class_name: "Event",
           through: :event_venues
  has_many :rooms,
           class_name: "Venue::Room",
           inverse_of: :venue
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true

  accepts_nested_attributes_for :rooms, allow_destroy: true
end
