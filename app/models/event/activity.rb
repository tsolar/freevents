class Event::Activity < ApplicationRecord
  belongs_to :event_day,
    class_name: "Event::Day"

  belongs_to :postulation,
    class_name: "Event::Activity::Postulation",
    foreign_key: :event_activity_postulation_id,
    optional: true

  has_many :participations,
    class_name: "Event::Activity::Participation",
    foreign_key: :event_activity_id,
    dependent: :destroy

  has_many :speakers,
    class_name: "Event::Activity::Speaker",
    foreign_key: :event_activity_id,
    dependent: :destroy

  has_one :event, through: :event_day
  delegate :starts_at, to: :event_day, prefix: true, allow_nil: true
  delegate :ends_at, to: :event_day, prefix: true, allow_nil: true

  validates :event_day, presence: true
  # TODO: maybe it'd be needed to save the event to validate the event day
  # belongs to the same event

  validates :title, presence: true

  validates :starts_at, timeliness: { on_or_before: :ends_at, on_or_after: :event_day_starts_at }, if: Proc.new { |x| x.starts_at.present? }
  validates :ends_at, timeliness: { on_or_before: :event_day_ends_at }, if: Proc.new { |x| x.ends_at.present? }
end
