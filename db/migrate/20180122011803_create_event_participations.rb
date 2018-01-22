class CreateEventParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :event_participations do |t|
      t.references :event, foreign_key: true
      t.string :type
      t.references :participant, polymorphic: true, index: { name: :index_event_participant }
      t.text :description

      t.timestamps
    end
  end
end
