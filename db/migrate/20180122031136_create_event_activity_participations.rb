class CreateEventActivityParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :event_activity_participations do |t|
      t.references :event_activity, foreign_key: true
      t.references :event_participation, foreign_key: true
      t.string :type

      t.timestamps
    end
  end
end
