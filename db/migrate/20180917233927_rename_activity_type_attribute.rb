class RenameActivityTypeAttribute < ActiveRecord::Migration[5.2]
  def change
    rename_column :event_activities, :type, :activity_type
  end
end
