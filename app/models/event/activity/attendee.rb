# frozen_string_literal: true

class Event::Activity::Attendee < Event::Activity::Participation
  has_one :answer,
          class_name: "Event::Activity::Participation::Answer",
          foreign_key: :event_activity_participation_id,
          inverse_of: :attendee,
          dependent: :destroy

  has_one :ticket, as: :holder, dependent: :destroy

  after_create :create_answer

  delegate :participant, to: :event_participation
  delegate :event, to: :event_participation

  def activity
    event_activity
  end
end
