# frozen_string_literal: true

class Event::Activity::Participation < ApplicationRecord
  belongs_to :event_activity,
             class_name: "Event::Activity"

  belongs_to :event_participation,
             class_name: "Event::Participation"

  validates :event_activity, presence: true
  validates :event_participation, presence: true
end
