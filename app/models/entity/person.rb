class Entity::Person < ApplicationRecord
  has_many :event_participations,
           as: :participant,
           class_name: "Event::Participation"

  has_many :emails,
           as: :emailable,
           class_name: "::Email"

  validates :firstname, presence: true
  validates :lastname, presence: true
end
