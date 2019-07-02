# frozen_string_literal: true

class Event::ActivityPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present? &&
      record.event.owner == user
  end

  def update?
    scope.where(id: record.id).exists? &&
      user.present? &&
      record.event.owner == user
  end

  def destroy?
    scope.where(id: record.id).exists? &&
      user.present? &&
      record.event.owner == user
  end

  def respond_attendance?
    # Not check for user.person. It's created if it's nil.
    scope.where(id: record.id).exists? && user.present? && !is_owner?
    # TODO: check if ticket is scanned
  end

  class Scope < Scope
    def resolve
      scope
    end
  end

  private

  def is_owner?
    user.present? && user == record.event.owner
  end
end
