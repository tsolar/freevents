# frozen_string_literal: true

module Ticketable
  extend ActiveSupport::Concern

  included do
    after_save :create_ticket

    validates :will_attend,
              inclusion: { in: %w[yes no maybe] },
              allow_nil: true
  end

  private

  def create_ticket
    return unless will_attend == "yes" && attendee.ticket.nil?

    Ticket.create(holder: attendee)
  end
end
