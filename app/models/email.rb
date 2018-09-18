# frozen_string_literal: true

class Email < ApplicationRecord
  belongs_to :emailable, polymorphic: true

  validates :address, presence: true
  validates :address, format: /.+@.+\..+/i
  validates :emailable, presence: true

  def to_s
    address
  end
end
