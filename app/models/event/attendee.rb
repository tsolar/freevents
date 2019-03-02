# frozen_string_literal: true

class Event::Attendee < Event::Participation
  has_one :answer,
          class_name: "Event::Participation::Answer",
          foreign_key: :event_participation_id,
          inverse_of: :attendee,
          dependent: :destroy

  has_one :ticket, as: :holder, dependent: :destroy

  after_create :create_answer

  def activity
    event
  end
end
