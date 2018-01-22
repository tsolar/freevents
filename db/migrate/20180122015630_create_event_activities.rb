class CreateEventActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :event_activities do |t|
      t.string :type
      t.references :event_day, foreign_key: true
      t.string :title
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
