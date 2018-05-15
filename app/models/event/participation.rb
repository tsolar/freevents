class Event::Participation < ApplicationRecord
  belongs_to :event
  belongs_to :participant, polymorphic: true

  validates :event, presence: true
  validates :participant, presence: true
end
