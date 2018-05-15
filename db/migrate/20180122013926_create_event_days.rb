class CreateEventDays < ActiveRecord::Migration[5.1]
  def change
    create_table :event_days do |t|
      t.references :event, foreign_key: true
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
