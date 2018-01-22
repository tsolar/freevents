class Event::Activity::Participation < ApplicationRecord
  belongs_to :event_activity
  belongs_to :event_participation
end
