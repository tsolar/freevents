class Ticket < ApplicationRecord
  # ticket holder is tipically an Attendee (Event::Attendee)
  # but it could be an Event::Activity::Attendee or something
  belongs_to :holder, polymorphic: true

  has_secure_token
  validates :token, uniqueness: true
end
