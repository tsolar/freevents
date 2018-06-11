class Ticket < ApplicationRecord
  # ticket holder is tipically an Attendee (Event::Attendee)
  # but it could be an Event::Activity::Attendee or something
  belongs_to :holder, polymorphic: true

  has_secure_token
  validates :token, uniqueness: true

  after_commit :send_to_holder, on: :create

  def scan
    if scanned?
      errors.add(:scanned, :already_scanned)
      return false
    end
    update_columns(scanned: true, scanned_at: Time.current)
  end

  private
    def send_to_holder
      TicketMailer.send_to_holder(self).deliver_later
    end
end
