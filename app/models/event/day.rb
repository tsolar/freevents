# frozen_string_literal: true

class Event::Day < ApplicationRecord
  belongs_to :event,
             inverse_of: :days
  has_many :activities,
           class_name: "Event::Activity",
           foreign_key: :event_day_id,
           dependent: :destroy

  validates :event, presence: true
  validates :starts_at, presence: true
  validates :starts_at, timeliness: { on_or_before: :ends_at }
  validates :ends_at, presence: true

  validate :ends_at_before_24_hours_since_starts_at

  def date
    starts_at.to_date if starts_at.present?
  end

  # TODO: test when ends on next day
  def to_s
    return I18n.t("tbd") unless starts_at.present?

    formatted_date
  end

  def formatted_date
    string = "#{I18n.l(starts_at, format: :event_day_with_time)} "
    string += if ends_at.to_date > starts_at.to_date
                "- #{I18n.l(ends_at, format: :event_day_with_time)}"
              else
                "- #{I18n.l(ends_at, format: :only_time)}"
              end
    string
  end

  private

  # TODO: test, there are some, but make some other more specific
  def ends_at_before_24_hours_since_starts_at
    condition = ends_at.present? &&
                starts_at.present? &&
                ends_at > (starts_at + 24.hours)
    return unless condition

    errors.add(:ends_at, :must_be_before_24_hours_since_starts_at)
  end
end
