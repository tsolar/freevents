class AddUserToEntityPeople < ActiveRecord::Migration[5.1]
  def change
    add_reference :entity_people, :user, foreign_key: true
  end
end
