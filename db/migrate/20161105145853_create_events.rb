class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :mode
      t.integer :user_id

      t.timestamps
    end
    add_index :events, :mode
    add_index :events, :user_id
  end
end
