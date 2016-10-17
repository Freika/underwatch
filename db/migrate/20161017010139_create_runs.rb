class CreateRuns < ActiveRecord::Migration[5.0]
  def change
    create_table :runs do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :runs, :user_id
    add_index :runs, :event_id
  end
end
