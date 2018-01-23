class Event::Day < ApplicationRecord
  belongs_to :event,
             inverse_of: :days
  has_many :activities,
           class_name: "Event::Activity",
           foreign_key: :event_day_id

  validates :event, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
end
