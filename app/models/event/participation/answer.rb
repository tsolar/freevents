class Event::Participation::Answer < ApplicationRecord
  belongs_to :attendee,
    class_name: "Event::Attendee",
    foreign_key: :event_participation_id,
    inverse_of: :answer

  validates :will_attend,
    inclusion: { in: ["yes", "no", "maybe"] },
    allow_nil: true

  # def update_attend_status(status)
  #   return true if will_attend == status
  #   update(will_attend: status)
  # end
end
