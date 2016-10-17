class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :difficulty, default: 1, null: false

      t.timestamps
    end
    add_index :events, :difficulty
  end
end
