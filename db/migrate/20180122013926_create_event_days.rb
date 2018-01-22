class CreateEventDays < ActiveRecord::Migration[5.1]
  def change
    create_table :event_days do |t|
      t.references :event, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
