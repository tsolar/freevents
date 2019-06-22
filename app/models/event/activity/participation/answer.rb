# frozen_string_literal: true

class Event::Activity::Participation::Answer < ApplicationRecord
  belongs_to :attendee,
             class_name: "Event::Activity::Attendee",
             foreign_key: :event_activity_participation_id,
             inverse_of: :answer

  include Ticketable
end
