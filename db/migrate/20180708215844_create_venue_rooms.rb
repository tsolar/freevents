class CreateVenueRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :venue_rooms do |t|
      t.references :venue, foreign_key: true
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
