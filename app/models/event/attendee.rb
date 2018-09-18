# frozen_string_literal: true

class Event::Attendee < Event::Participation
  has_one :answer,
          class_name: "Event::Participation::Answer",
          foreign_key: :event_participation_id,
          inverse_of: :attendee

  has_one :ticket, as: :holder

  after_create :create_answer
end
