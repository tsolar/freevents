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

  class Scope < Scope
    def resolve
      scope
    end
  end
end
