# frozen_string_literal: true

class Event::Activity::Attendee < Event::Activity::Participation
  # TODO: create concern with this?
  has_one :ticket, as: :holder, dependent: :destroy

  after_save :create_ticket

  delegate :participant, to: :event_participation

  def activity
    event_activity
  end

  private

  def create_ticket
    # event_participation is an attendee
    Ticket.create(holder: self)
  end
end
