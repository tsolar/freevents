class Event < ApplicationRecord
  has_many :days,
           inverse_of: :event,
           dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :activities,
           through: :days,
           class_name: "Event::Activity",
           dependent: :destroy
  has_many :event_venues,
           class_name: "Event::Venue",
           dependent: :destroy
  has_many :venues,
           class_name: "::Venue",
           through: :event_venues,
           source: :venue

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :days, presence: true

  accepts_nested_attributes_for :days, allow_destroy: true

  def to_s
    title
  end
end
