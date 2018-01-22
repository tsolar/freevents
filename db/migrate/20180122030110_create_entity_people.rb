class CreateEntityPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :entity_people do |t|
      t.string :firstname
      t.string :lastname
      t.date :dob
      t.text :bio

      t.timestamps
    end
  end
end
