class Venue::Room < ApplicationRecord
  belongs_to :venue, inverse_of: :rooms

  validates :name, presence: true

  validates :capacity, numericality: { greater_than: 0 }

  # TODO: test
  def to_s
    name
  end
end
