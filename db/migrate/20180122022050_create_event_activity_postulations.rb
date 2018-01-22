class CreateEventActivityPostulations < ActiveRecord::Migration[5.1]
  def change
    create_table :event_activity_postulations do |t|
      t.references :event, foreign_key: true
      t.string :postulant_firstname
      t.string :postulant_lastname
      t.string :postulant_email
      t.string :postulant_phone_number
      t.text :postulant_bio
      t.string :activity_type
      t.string :activity_title
      t.text :activity_description
      t.integer :activity_estimated_duration
      t.string :activity_difficulty_level
      t.string :activity_preferred_time

      t.timestamps
    end

    # Reference in activity to which postulation it belongs to
    add_reference :event_activities, :event_activity_postulation, index: true, foreign_key: true
  end
end
