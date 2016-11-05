class AddRegionToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :region, :integer
    add_index :users, :region
  end
end
