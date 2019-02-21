# frozen_string_literal: true

class Venue::Room < ApplicationRecord
  belongs_to :venue, inverse_of: :rooms

  validates :name, presence: true
  validates :name, uniqueness: { scope: :venue_id }

  validates :capacity, numericality: { greater_than: 0 }

  # TODO: test
  def to_s
    "#{name} (#{venue.name})"
  end
end
