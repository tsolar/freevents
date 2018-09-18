# frozen_string_literal: true

class TicketPolicy < ApplicationPolicy
  def show?
    user_is_ticket_holder?
  end

  def scan?
    user_is_event_owner?
  end

  def print?
    show?
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def user_is_ticket_holder?
    user.present? && user == record.holder.participant.user
  end

  def user_is_event_owner?
    user.present? && user == record.holder.event.owner
  end
end
