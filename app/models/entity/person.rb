class Entity::Person < ApplicationRecord
  has_many :event_participations,
    as: :participant,
    class_name: "Event::Participation"

  has_many :emails,
    as: :emailable,
    class_name: "::Email"

  belongs_to :user, inverse_of: :person

  validates :firstname, presence: true
  # validates :lastname, presence: true
  validates :bio, length: { maximum: 300 }

  def full_name
    [firstname, lastname].join(" ").strip.squeeze(" ")
  end
end
