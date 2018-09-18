# frozen_string_literal: true

class Entity::Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :type }
end
