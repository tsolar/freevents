# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :days,
           -> { order("starts_at ASC") },
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

  has_many :activity_postulations,
           class_name: "Event::Activity::Postulation",
           dependent: :destroy

  belongs_to :owner,
             inverse_of: :events,
             class_name: "User",
             foreign_key: :owner_id

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :days, presence: true

  accepts_nested_attributes_for :venues, allow_destroy: true
  accepts_nested_attributes_for :days, allow_destroy: true

  # TODO: notify attendees
  # after_destroy :notify_attendees_event_was_canceled

  def to_s
    title
  end

  def dates
    dates = days.first.starts_at.strftime("%F %R").to_s

    if days.count > 1
      dates = "#{dates} - #{days.last.ends_at.strftime('%F %R')}"
    end

    dates
  end
end
