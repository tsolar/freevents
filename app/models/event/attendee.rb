class Event::Attendee < Event::Participation
  has_one :answer,
    class_name: "Event::Participation::Answer",
    foreign_key: :event_participation_id,
    inverse_of: :attendee

  after_create :create_answer
end
