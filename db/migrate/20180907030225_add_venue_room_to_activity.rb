class AddVenueRoomToActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :event_activities, :venue_room, foreign_key: true
  end
end
