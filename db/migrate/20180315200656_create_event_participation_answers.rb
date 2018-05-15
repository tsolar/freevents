class CreateEventParticipationAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :event_participation_answers do |t|
      t.references :event_participation, foreign_key: true
      t.string :will_attend
      t.boolean :did_attend

      t.timestamps
    end
  end
end
