class Event::Activity::PostulationPolicy < ApplicationPolicy
  def show?
    super && user.present? && record.event.owner == user
  end

  def create?
    true
  end

  def destroy?
    show? # if can see postulation, should be able to delete it
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
