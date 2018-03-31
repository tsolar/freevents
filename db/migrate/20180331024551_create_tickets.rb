class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.references :holder, polymorphic: true
      t.string :token
      t.boolean :scanned
      t.datetime :scanned_at

      t.timestamps
    end
  end
end
