class CreateEntityOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :entity_organizations do |t|
      t.string :type
      t.string :name

      t.timestamps
    end
  end
end
