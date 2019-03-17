class CreateEventActivityParticipationAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :event_activity_participation_answers do |t|
      t.references :event_activity_participation, foreign_key: true, index: {
        name: :index_event_activity_participation
      }
      t.string :will_attend
      t.boolean :did_attend

      t.timestamps
    end
  end
end
