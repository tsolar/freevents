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

  delegate :event, to: :event_day

  validates :event_day, presence: true
  validates :title, presence: true
end
