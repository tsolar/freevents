# frozen_string_literal: true

class Event::Participation::Answer < ApplicationRecord
  belongs_to :attendee,
    class_name: "Event::Attendee",
    foreign_key: :event_participation_id,
    inverse_of: :answer

  include Ticketable
end
