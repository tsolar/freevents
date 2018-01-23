class Event::Participation < ApplicationRecord
  belongs_to :event
  belongs_to :participant, polymorphic: true, required: false

  validates :event, presence: true
end
