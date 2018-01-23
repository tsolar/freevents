class Entity::Organization < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :type }
end
