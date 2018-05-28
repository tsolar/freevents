class Event::Day < ApplicationRecord
  belongs_to :event,
             inverse_of: :days
  has_many :activities,
           class_name: "Event::Activity",
           foreign_key: :event_day_id

  validates :event, presence: true
  validates :starts_at, presence: true
  validates :starts_at, timeliness: { on_or_before: :ends_at }
  validates :ends_at, presence: true

  def date
    starts_at.to_date if starts_at.present?
  end

  def to_s
    date.to_s
  end
end
