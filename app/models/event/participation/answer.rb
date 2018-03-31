class Event::Participation::Answer < ApplicationRecord
  belongs_to :attendee,
    class_name: "Event::Attendee",
    foreign_key: :event_participation_id,
    inverse_of: :answer

  after_save :create_ticket

  validates :will_attend,
    inclusion: { in: ["yes", "no", "maybe"] },
    allow_nil: true

  private
    def create_ticket
      if will_attend == "yes" && attendee.ticket.nil?
        Ticket.create(holder: attendee)
      end
    end
end
