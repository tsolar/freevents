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

  # TODO: test
  belongs_to :venue_room, class_name: "Venue::Room", optional: true

  delegate :starts_at, to: :event_day, prefix: true, allow_nil: true
  delegate :ends_at, to: :event_day, prefix: true, allow_nil: true

  validates :event_day, presence: true
  # TODO: maybe it'd be needed to save the event to validate the event day
  # belongs to the same event

  validates :title, presence: true

  validates :starts_at, timeliness: { on_or_before: :ends_at, on_or_after: :event_day_starts_at }, if: Proc.new { |x| x.starts_at.present? }
  validates :ends_at, timeliness: { on_or_before: :event_day_ends_at }, if: Proc.new { |x| x.ends_at.present? }
  # validates_date :starts_at, is_at: Proc.new { |x| x.event_day_starts_at.to_date }
  validate :starts_at_event_day_date, if: Proc.new { |x| x.starts_at? && x.event_day_starts_at.present? }
  validate :ends_at_event_day_date, if: Proc.new { |x| x.starts_at? && x.event_day_starts_at.present? }

  private

  def starts_at_event_day_date
    # TODO: rename this method to check activity is starts on or after event day started
    if starts_at.to_date != event_day_starts_at.to_date
      errors.add(:starts_at, :must_be_on_event_day_date)
    end
  end

  def ends_at_event_day_date
    # TODO: rename this method to check activity is ending before event day ends
    if ends_at.to_date > event_day_ends_at.to_date
      errors.add(:ends_at, :must_be_on_event_day_date)
    end
  end
end
